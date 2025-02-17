#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2154

# Copyright Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

source "tests/util/gateway-api.sh"
install_gateway_api_crds

# @setup profile=none
source "content/en/boilerplates/snips/gateway-api-gamma-support.sh"
bpsnip_gateway_api_gamma_support_enable_alpha_crds
source "content/en/docs/tasks/traffic-management/tcp-traffic-shifting/test.sh"

# @cleanup
snip_cleanup_2
snip_cleanup_3

istioctl uninstall --purge -y
kubectl delete ns istio-system
remove_gateway_api_crds
