#!/bin/bash
#
#**************************************************
# Author:         xuhong                          *
# E-mail:         zaitianya999@163.com            *
# Date:           2023-04-26                      *
# Description:                              *
# Copyright 2023 by Vedkang.com Rights Reserved  *
#**************************************************

#!/bin/sh

find . -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.files

cscope -bkq -i cscope.files

ctags -R
