// TODO: Figure out how to enable the includes below without bringing in the mess tcpip_adapter.h causes

#include "esp_system.h"

#include "esp_aio.h"
#include "esp_attr.h"
#include "esp_clk.h"
#include "esp_interface.h"
#include "esp_libc.h"
#include "esp_netif.h"
#include "esp_now.h"
#include "esp_phy_init.h"
#include "esp_sleep.h"
#include "esp_smartconfig.h"
#include "esp_ssc.h"
#include "esp_task_wdt.h"
#include "esp_timer.h"
#include "esp_types.h"

//#include "esp_event_loop.h"
//#include "esp_event.h"

//#include "esp_wifi.h"

//#include "apps/ping/ping_sock.h"

//#include "esp_http_server.h"

#include "nvs.h"
#include "nvs_flash.h"

#include "driver/adc.h"
#include "driver/gpio.h"
//#include "driver/hspi_logic_layer.h"
#include "driver/hw_timer.h"
#include "driver/i2c.h"
#include "driver/i2s.h"
#include "driver/ir_rx.h"
#include "driver/ir_tx.h"
#include "driver/ledc.h"
#include "driver/pwm.h"
#include "driver/rtc.h"
#include "driver/soc.h"
#include "driver/spi.h"
#include "driver/uart.h"
#include "driver/uart_select.h"
