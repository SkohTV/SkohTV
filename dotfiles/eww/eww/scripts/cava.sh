#!/bin/bash

printf "[general]\nframerate=60\nbars = 16\n[output]\nmethod = raw\nraw_target = /dev/stdout\ndata_format = ascii\nascii_max_range = 7\n[input]\nmethod = pulse\nsource = auto\n" | cava -p /dev/stdin | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g; '