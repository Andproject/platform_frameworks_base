#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    main_drmserver.cpp \
    DrmManager.cpp \
    DrmManagerService.cpp \
    StringTokenizer.cpp

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libbinder

ifeq ($(TARGET_SIMULATOR),true)
 LOCAL_LDLIBS += -ldl
else
 LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_STATIC_LIBRARIES := libdrmframeworkcommon

LOCAL_C_INCLUDES := \
    $(TOP)/frameworks/base/include \
    $(TOP)/frameworks/base/drm/libdrmframework/include \
    $(TOP)/frameworks/base/drm/libdrmframework/plugins/common/include

LOCAL_MODULE:= drmserver

include $(BUILD_EXECUTABLE)