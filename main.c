#include <avr/io.h>
#include <avr/wdt.h>
#include "usbdrv/usbconfig.h"
#include "usbdrv/usbdrv.h"
#include <avr/pgmspace.h>
#include <avr/interrupt.h>
#include <avr/power.h>
#include <util/delay.h>

#define REPORT_BUFFER_FULL_SIZE 8
#define REPORT_BUFFER_SIZE 6
#define KEYPRESS_BUFFER_SIZE 6

uint8_t report_buffer[REPORT_BUFFER_FULL_SIZE];
uint8_t usb_hasCommed = 0;
uint8_t idle_rate = 500 / 4;
uint8_t protocol_version = 0;
uint8_t led_state = 0;

uint8_t keypress_buffer[KEYPRESS_BUFFER_SIZE] = {};
uint8_t keypress_buffer_counter = 0;

uint8_t read_state = 0;
uint16_t read_wait_counter = 0;

void usbBegin()
{
    PORTD &= ~(_BV(USB_CFG_DMINUS_BIT) | _BV(USB_CFG_DPLUS_BIT));

    usbDeviceDisconnect();
    _delay_ms(300);
    usbDeviceConnect();

    wdt_enable(WDTO_1S);
    usbInit();
}

const PROGMEM char usbHidReportDescriptor[USB_CFG_HID_REPORT_DESCRIPTOR_LENGTH] = {
	0x05, 0x01,  // USAGE_PAGE (Generic Desktop)
	0x09, 0x06,  // USAGE (Keyboard)
	0xA1, 0x01,  // COLLECTION (Application)
	0x05, 0x07,  //   USAGE_PAGE (Keyboard)(Key Codes)
	0x19, 0xE0,  //   USAGE_MINIMUM (Keyboard LeftControl)(224)
	0x29, 0xE7,  //   USAGE_MAXIMUM (Keyboard Right GUI)(231)
	0x15, 0x00,  //   LOGICAL_MINIMUM (0)
	0x25, 0x01,  //   LOGICAL_MAXIMUM (1)
	0x75, 0x01,  //   REPORT_SIZE (1)
	0x95, 0x08,  //   REPORT_COUNT (8)
	0x81, 0x02,  //   INPUT (Data,Var,Abs) ; Modifier byte
	0x95, 0x01,  //   REPORT_COUNT (1)
	0x75, 0x08,  //   REPORT_SIZE (8)
	0x81, 0x03,  //   INPUT (Cnst,Var,Abs) ; Reserved byte
	0x95, 0x05,  //   REPORT_COUNT (5)
	0x75, 0x01,  //   REPORT_SIZE (1)
	0x05, 0x08,  //   USAGE_PAGE (LEDs)
	0x19, 0x01,  //   USAGE_MINIMUM (Num Lock)
	0x29, 0x05,  //   USAGE_MAXIMUM (Kana)
	0x91, 0x02,  //   OUTPUT (Data,Var,Abs) ; LED report
	0x95, 0x01,  //   REPORT_COUNT (1)
	0x75, 0x03,  //   REPORT_SIZE (3)
	0x91, 0x03,  //   OUTPUT (Cnst,Var,Abs) ; LED report padding
	0x95, 0x06,  //   REPORT_COUNT (6)
	0x75, 0x08,  //   REPORT_SIZE (8)
	0x15, 0x00,  //   LOGICAL_MINIMUM (0)
	0x25, 0x65,  //   LOGICAL_MAXIMUM (101)
	0x05, 0x07,  //   USAGE_PAGE (Keyboard)(Key Codes)
	0x19, 0x00,  //   USAGE_MINIMUM (Reserved (no evFAent indicated))(0)
	0x29, 0x65,  //   USAGE_MAXIMUM (Keyboard Application)(101)
	0x81, 0x00,  //   INPUT (Data,Ary,Abs)
	0xC0         // END_COLLECTION
};

usbMsgLen_t usbFunctionSetup(uint8_t data[8])
{
	usb_hasCommed = 1;

	// see HID1_11.pdf sect 7.2 and http://vusb.wikidot.com/driver-api
	usbRequest_t *rq = (void *)data;

	if ((rq->bmRequestType & USBRQ_TYPE_MASK) != USBRQ_TYPE_CLASS)
		return 0; // ignore request if it's not a class specific request

	// see HID1_11.pdf sect 7.2
	switch (rq->bRequest)
	{
		case USBRQ_HID_GET_IDLE:
			usbMsgPtr = &idle_rate; // send data starting from this byte
			return 1; // send 1 byte
		case USBRQ_HID_SET_IDLE:
			idle_rate = rq->wValue.bytes[1]; // read in idle rate
			return 0; // send nothing
		case USBRQ_HID_GET_PROTOCOL:
			usbMsgPtr = &protocol_version; // send data starting from this byte
			return 1; // send 1 byte
		case USBRQ_HID_SET_PROTOCOL:
			protocol_version = rq->wValue.bytes[1];
			return 0; // send nothing
		case USBRQ_HID_GET_REPORT:
			usbMsgPtr = (uint8_t*)report_buffer; // send the report data
			return 8;
		case USBRQ_HID_SET_REPORT:
			if (rq->wLength.word == 1) // check data is available
			{
				return USB_NO_MSG; // send nothing but call usbFunctionWrite
			}
			else // no data or do not understandFAFU2EHA data, ignore
			{
				return 0; // send nothing
			}
		default: // do not understand data, ignore
			return 0; // send nothing
	}
}

usbMsgLen_t usbFunctionWrite(uint8_t * data, uchar len)
{
	led_state = data[0];
	return 1; // 1 byte read
}

// Start    - 1       - 1E  - 30    - PB0
// Coin     - 5       - 22  - 34    - PB1
// Fire1    - L Ctrl  - E0  - 224   - PB2
// Fire2    - L Alt   - E2  - 226   - PB3
// Fire3    - Space   - 2C  - 44    - PB4
// Fire4    - L Shift - E1  - 225   - PB5
int portBKeyMap[6] = {0x1E, 0x22, 0xE0, 0xE2, 0x2c, 0xE1};

// Fire5    - Z       - 1D  - 29    - PC0
// Fire6    - X       - 1B  - 27    - PC1
// Up       - Up      - 52  - 82    - PC2
// Down     - Down    - 51  - 81    - PC3
// Left     - Left    - 50  - 80    - PC4
// Right    - Right   - 4F  - 79    - PC5
int portCKeyMap[6] = {0x1D, 0x1B, 0x52, 0x51, 0x50, 0x4F};

void readKeys() {
  uint8_t keyNumber = 0;
  uint8_t i = 0;
  for(i = 0; i < KEYPRESS_BUFFER_SIZE; i++) {
    keypress_buffer[i] = 0;
  }
  keypress_buffer_counter = 0;

  for(keyNumber = 0 ; keyNumber < 6; keyNumber++) {
    if(keypress_buffer_counter >= KEYPRESS_BUFFER_SIZE) {
      break;
    }

    if(!(PINB & (1<<keyNumber))) {
      uint8_t key = portBKeyMap[keyNumber];
      keypress_buffer[keypress_buffer_counter++] = key;
    }
  }

  for(keyNumber = 0 ; keyNumber < 5; keyNumber++) {
    if(keypress_buffer_counter >= KEYPRESS_BUFFER_SIZE) {
      break;
    }

    if(!(PINC & (1<<keyNumber))) {
      uint8_t key = portCKeyMap[keyNumber];
      keypress_buffer[keypress_buffer_counter++] = key;
    }
  }
}

void buildReport() {
  report_buffer[0] = 0;
  report_buffer[1] = 0;
  uint8_t i = 0;
  for(i = 0; i < KEYPRESS_BUFFER_SIZE; i++) {
    report_buffer[i+2] = keypress_buffer[i];
  }
}

void setupPorts() {
  DDRB = 0b00000000; // Port B 0-5 for Input 6-7 Reserved for XTAL
  PORTB = 0b00011111;
  DDRC = 0b00000000; // Port C 0-5 for Input 6 Unused
  PORTC = 0b00011111;
  PORTD = 0xfa;   // 1111 1010 bin: activate pull-ups except on USB lines */
  DDRD = 0x07;    // 0000 0111 bin: all pins input except USB (-> USB reset) */
  _delay_ms(20);
  DDRD = 0x00;    // 0000 0000 bin: remove USB reset condition
  TCCR0B = 5;      // Timer0 prescaler: 1024
}

int main(void) {

  cli();
  setupPorts();
  usbBegin();
  sei();

  for (;;) {
    wdt_reset();
    usbPoll();

    if(read_state == 0) {
      readKeys();
      read_state = 1;
    } else {
      if(read_wait_counter == 0x1000) {
        read_wait_counter++;
        read_wait_counter = 0;
        read_state = 0;
      } else {
        read_wait_counter++;
      }
    }

		if (usbInterruptIsReady())
		{
      buildReport();
      usbSetInterrupt((uint8_t*)report_buffer, REPORT_BUFFER_FULL_SIZE); // send
		}
  }
  return 0;
}
