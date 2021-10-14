#!/sbin/sh
# Copyright (c) 2015 Sony Mobile Communications Inc.

touch_path="/sys/devices/virtual/input/"
touch_vendor_id=$(/sbin/ta_param_loader -p -t 4950 -d 0 -f "0x%02x")
if [ "$touch_vendor_id" = "0x01" ]; then
    touch_module_id=0x$(/sbin/ta_param_loader -p -t 4950 -d 3 -c 2 -f "%02x")
    /sbin/clearpad_fwloader default $touch_module_id
elif [ "$touch_vendor_id" = "0x02" ]; then
    touch_chip_id=0x$(/sbin/ta_param_loader -p -t 4950 -d 1 -c 2 -f "%02x")
    touch_config_id=0x$(/sbin/ta_param_loader -p -t 4950 -d 3 -c 2 -f "%02x")
    echo 1 $touch_config_id $touch_chip_id > "$touch_path/max1187x/dflt_cfg"
    echo default > "$touch_path/max1187x/fw_update"
else
    if [ -a "$touch_path/clearpad" ]; then
        touch_module_id=$(/sbin/ta_param_loader -t 60221 -f "0x%02x")
        if [ "$touch_module_id" = "0x00" ]; then
            touch_module_id=0x$(cat $touch_path/clearpad/fwfamily)
        fi
        /sbin/clearpad_fwloader default $touch_module_id
    elif [ -a "$touch_path/max1187x" ]; then
        touch_chip_id=$(cat $touch_path/max1187x/chip_id)
        touch_config_id=$(cat $touch_path/max1187x/config_id)
        echo 1 $touch_config_id $touch_chip_id > "$touch_path/max1187x/dflt_cfg"
        echo default > "$touch_path/max1187x/fw_update"
    fi
    log "*** touch: No valid Misc TA 4950"
fi
