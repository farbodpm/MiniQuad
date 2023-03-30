
use esp_idf_hal::peripherals::Peripherals;
use esp_idf_sys as _;
extern crate spin;
use spin::Mutex;
use esp_idf_hal::prelude::*;
use std::time::Duration;
use esp_idf_hal::i2c::{I2cConfig , I2cDriver};
use mpu6050::*;

struct Delay ;

impl embedded_hal_0_2::blocking::delay::DelayMs<u8> for Delay{
    fn delay_ms(&mut self, ms: u8 ) {
        std::thread::sleep_ms(ms as u32);

    }

}


fn main() {
    esp_idf_sys::link_patches();
    let peripherals = Peripherals::take().unwrap();
    let i2c = peripherals.i2c0;
    let sda = peripherals.pins.gpio21;
    let scl = peripherals.pins.gpio22;

    std::

    println!("Starting I2C SSD1306 test");
    let config = I2cConfig::new().baudrate(100.kHz().into());
    let mut i2c = I2cDriver::new(i2c, sda, scl, &config).unwrap();
    let mut mpu = Mpu6050::new(i2c);
    let mut delay = Delay;
    mpu.init(& mut delay).unwrap();
    loop {
        let data = mpu.get_acc().unwrap();
        println!("salam data is : {:?}", data);
        std::thread::sleep(Duration::from_millis(100));
    }
}

