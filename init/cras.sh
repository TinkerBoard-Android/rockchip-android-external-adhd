# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# For board needs different device configs, check which config
# directory to use. Use that directory for both volume curves
# and dsp config.
if [ -f /etc/cras/get_device_config_dir ]; then
  device_config_dir="$(sh /etc/cras/get_device_config_dir)"
  DEVICE_CONFIG_DIR="--device_config_dir=${device_config_dir}"
  DSP_CONFIG="--dsp_config=${device_config_dir}/dsp.ini"
fi
exec minijail0 -u cras -g cras -G -- /usr/bin/cras \
    ${DSP_CONFIG} ${DEVICE_CONFIG_DIR}
