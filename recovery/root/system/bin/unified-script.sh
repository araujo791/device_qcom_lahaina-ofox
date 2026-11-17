#!/system/bin/sh
# This script is needed to automatically set device props for Realme GT 2 (lahaina / porsche).

load_RMX3312IN()
{
      echo "Setting up props for RMX3312IN"
      resetprop "ro.build.product" "RMX3312"
      resetprop "ro.product.model" "RMX3312"
      resetprop "ro.product.device" "RE58B2L1"
      resetprop "ro.product.product.device" "RE58B2L1"
      resetprop "ro.product.vendor.device" "porsche"
      resetprop "ro.vendor.product.device" "porsche"
      resetprop "ro.commonsoft.ota" "RE58B2L1"
      resetprop "ro.separate.soft" "216B2"
}

load_RMX3311EU()
{
      echo "Setting up props for RMX3311EU (porsche)"
      resetprop "ro.build.product" "RMX3311"
      resetprop "ro.product.model" "RMX3311"
      resetprop "ro.product.device" "RE58B2L1"
      resetprop "ro.product.product.device" "RE58B2L1"
      resetprop "ro.product.vendor.device" "porsche"
      resetprop "ro.vendor.product.device" "porsche"
      resetprop "ro.commonsoft.ota" "RE58B2L1"
      resetprop "ro.separate.soft" "216B3"
}

load_RMX3310CN()
{
      echo "Setting up props for RMX3310CN"
      resetprop "ro.build.product" "RMX3310"
      resetprop "ro.product.model" "RMX3310"
      resetprop "ro.product.device" "RE58B2L1"
      resetprop "ro.product.product.device" "RE58B2L1"
      resetprop "ro.product.vendor.device" "porsche"
      resetprop "ro.vendor.product.device" "porsche"
      resetprop "ro.commonsoft.ota" "RE58B2L1"
      resetprop "ro.separate.soft" "216B1"
}

project=""
if [ -f /proc/oplusVersion/prjName ]; then
    project=$(cat /proc/oplusVersion/prjName 2>/dev/null)
fi

if [ -z "$project" ]; then
    project=$(getprop ro.boot.prjname)
fi

if [ -z "$project" ]; then
    project=$(getprop ro.boot.project_name)
fi

echo "Detected project: $project"

case $project in
     "216B2")
          load_RMX3312IN
          ;;
     "216B3")
          load_RMX3311EU
          ;;
     "216B1")
          load_RMX3310CN
          ;;
     *)
          # Default to RMX3311EU (porsche Global) for AOSP/AOSPA
          load_RMX3311EU
          ;;
esac

exit 0
