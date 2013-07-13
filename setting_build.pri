# Build Setting

linux-g++ {
    message("Qt5.x X11 making")
#   MAKEFILE     = .Makefile_X11/Makefile
    MOC_DIR     = .moc_X11
    OBJECTS_DIR = .obj_X11
    RCC_DIR     = .rcc_X11
#   DESTDIR     = $$PWD/_X11
}
else :linux-rasp-pi-g++ {
    message("Qt5.x RaspberryPi making")
#   MAKEFILE     = .Makefile_Raspi/Makefile
    MOC_DIR     = .moc_Raspi
    OBJECTS_DIR = .obj_Raspi
    RCC_DIR     = .rcc_X11
#   DESTDIR     = $$PWD/_Raspi
}

