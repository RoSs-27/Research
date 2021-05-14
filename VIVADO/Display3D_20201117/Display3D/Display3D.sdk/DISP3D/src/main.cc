/*
 * Empty C++ Application
 */
#include <xparameters.h>  //--
#include <xuartlite.h>
#include <xgpio.h>
#include <xtmrctr.h>
#include <xintc.h>
#include <xil_printf.h>

class RevHW {
public:
	u8 major;
	u8 minor;
} REV_HW;

XGpio gpio_ledsw;
const u16 gpio_ledsw_devID = XPAR_GPIO_LEDSW_DEVICE_ID;
const unsigned gpio_led_channel = 1;
const unsigned gpio_sw_channel = 2;

XIntc intc;
const u16 intc_devID = XPAR_INTR_DEVICE_ID;

int init();
int capture_HwRev();
void GpioHandler(void *CallbackRef);


int main()
{
	xil_printf("**********************\n");
	xil_printf("* Project 3D Display *\n");
	xil_printf("**********************\n");

	int status;
	int i = 37;
	init();
	capture_HwRev();
	xil_printf("Hardware revision is %u.%u\n", ::REV_HW.major, ::REV_HW.minor);

	microblaze_enable_interrupts();
    XIntc_Enable(&intc, XPAR_INTC_0_GPIO_1_VEC_ID);   // XGpioの割り込みを有効化

	status = XIntc_Start(&intc, XIN_REAL_MODE);
	if(status != XST_SUCCESS) return XST_FAILURE;
	//Xil_ExceptionInit();
	//Xil_ExceptionEnable();
	XGpio_InterruptEnable(&gpio_ledsw, 0xFFFFFFFF);
	XGpio_InterruptGlobalEnable(&gpio_ledsw);

	while(1) { //--

	}

	return 0;
}

// GPIO Interrupt Handler
void GpioHandler(void *CallbackRef)
{
    XGpio *GpioPtr = (XGpio *)CallbackRef;
    static u32 called = 0;

    xil_printf("Gpio Interrupt! (%u)\n", called);
    // Clear the Interrupt
    XGpio_InterruptClear(GpioPtr, 0xFFFFFFFF);
    called++;
}

int init()
{
	int status;

	//*
	// Initialize GPIO module.
	//
	status = XGpio_Initialize(&::gpio_ledsw, ::gpio_ledsw_devID);
	if (status == XST_SUCCESS) {
		xil_printf("GPIO(DevID=%d) initialization completed.\n", ::gpio_ledsw_devID);
	} else {
		xil_printf("GPIO(DevID=%d) initialization failed.\n", ::gpio_ledsw_devID);
		return XST_FAILURE;
	}

	XGpio_DiscreteWrite(&gpio_ledsw, ::gpio_led_channel, 0xFFFF);
	//*
	// Initialize Interrupt module.
	//
	status = XIntc_Initialize(&::intc, ::intc_devID);
	if (status == XST_SUCCESS) {
		xil_printf("Interrupt controller(DevID=%d) initialization completed.\n", ::intc_devID);
	} else {
		xil_printf("Interrupt controller(DevID=%d) initialization failed.\n", ::intc_devID);
		return XST_FAILURE;
	}

	 // XGpioの割り込みで呼び出される関数を指定
	 status = XIntc_Connect(&intc, XPAR_INTC_0_GPIO_1_VEC_ID,
	                (XInterruptHandler)GpioHandler,
	                (void *)&gpio_ledsw);
	if (status == XST_SUCCESS) {
		xil_printf("Interrupt register completed.\n");
	} else {
		xil_printf("Interrupt register failed.\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int capture_HwRev()
{
	XGpio gpio_revhw;
	const unsigned gpio_channel = 1;
	const u16 gpio_revhw_devID = XPAR_GPIO_REVHW_DEVICE_ID;
	u32 reg = 0;

	int status = XGpio_Initialize(&gpio_revhw, gpio_revhw_devID);
	if (status == XST_SUCCESS) {
		xil_printf("GPIO(DevID=%d) initialization completed.\n", gpio_revhw_devID);
	} else {
		xil_printf("GPIO(DevID=%d) initialization failed.\n", gpio_revhw_devID);
		return XST_FAILURE;
	}
	reg = XGpio_DiscreteRead(&gpio_revhw, gpio_channel);
	::REV_HW.major = (reg >> 8) & 0xFF;
	::REV_HW.minor = (reg & 0xFF);


	//Xil_ExceptionInit(); //-- Initialize interruption at MicroBlaze.

	//--Register intc.
	//Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XIntc_InterruptHander, &intc);

	//Xil_ExceptionEnable(); //-- Enable interruption at MicroBlaze.




	return XST_SUCCESS;
}


