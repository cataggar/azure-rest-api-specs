using TypeSpec.Http;
using Azure.ResourceManager;

namespace Microsoft.AVS;

@doc("The parameter for the private cloud name.")
model PrivateCloudParameter {
  @path
  @doc("Name of the private cloud")
  @pattern("^[-\\w\\._]+$")
  privateCloudName: string;
}

@doc("The parameter for the cluster name.")
model ClusterNameParameter {
  @path
  @doc("Name of the cluster in the private cloud.")
  @pattern("^[-\\w\\._]+$")
  clusterName: string;
}

//   "hcxEnterpriseSiteName": {
//     "name": "hcxEnterpriseSiteName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the HCX Enterprise Site in the private cloud",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "addonName": {
//     "name": "addonName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the addon for the private cloud",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "authorizationName": {
//     "name": "authorizationName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the ExpressRoute Circuit Authorization in the private cloud",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "globalReachConnectionName": {
//     "name": "globalReachConnectionName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the global reach connection in the private cloud",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "segmentId": {
//     "name": "segmentId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "NSX Segment identifier. Generally the same as the Segment's display name",
//     "x-ms-parameter-location": "method"
//   },
//   "dhcpId": {
//     "name": "dhcpId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "NSX DHCP identifier. Generally the same as the DHCP display name",
//     "x-ms-parameter-location": "method"
//   },
//   "portMirroringId": {
//     "name": "portMirroringId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "NSX Port Mirroring identifier. Generally the same as the Port Mirroring display name",
//     "x-ms-parameter-location": "method"
//   },
//   "vmGroupId": {
//     "name": "vmGroupId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "NSX VM Group identifier. Generally the same as the VM Group's display name",
//     "x-ms-parameter-location": "method"
//   },
//   "virtualMachineId": {
//     "name": "virtualMachineId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Virtual Machine identifier",
//     "x-ms-parameter-location": "method"
//   },
//   "gatewayId": {
//     "name": "gatewayId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "NSX Gateway identifier. Generally the same as the Gateway's display name",
//     "x-ms-parameter-location": "method"
//   },
//   "dnsServiceId": {
//     "name": "dnsServiceId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "NSX DNS Service identifier. Generally the same as the DNS Service's display name",
//     "x-ms-parameter-location": "method"
//   },
//   "dnsZoneId": {
//     "name": "dnsZoneId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "NSX DNS Zone identifier. Generally the same as the DNS Zone's display name",
//     "x-ms-parameter-location": "method"
//   },
//   "publicIPId": {
//     "name": "publicIPId",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "NSX Public IP Block identifier. Generally the same as the Public IP Block's display name",
//     "x-ms-parameter-location": "method"
//   },
//   "datastoreName": {
//     "name": "datastoreName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the datastore in the private cloud cluster",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "cloudLinkName": {
//     "name": "cloudLinkName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the cloud link resource",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "placementPolicyName": {
//     "name": "placementPolicyName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the VMware vSphere Distributed Resource Scheduler (DRS) placement policy",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "scriptExecutionName": {
//     "name": "scriptExecutionName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the user-invoked script execution resource",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "scriptPackageName": {
//     "name": "scriptPackageName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the script package in the private cloud",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._@]+$"
//   },
//   "scriptCmdletName": {
//     "name": "scriptCmdletName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the script cmdlet resource in the script package in the private cloud",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "scriptOutputStreamType": {
//     "name": "scriptOutputStreamType",
//     "in": "body",
//     "required": false,
//     "schema": {
//       "type": "array",
//       "items": {
//         "type": "string",
//         "enum": [
//           "Information",
//           "Warning",
//           "Output",
//           "Error"
//         ],
//         "x-ms-enum": {
//           "name": "ScriptOutputStreamType",
//           "modelAsString": true
//         }
//       }
//     },
//     "description": "Name of the desired output stream to return. If not provided, will return all. An empty array will return nothing",
//     "x-ms-parameter-location": "method"
//   },
//   "workloadNetworkName": {
//     "name": "workloadNetworkName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "enum": [
//       "default"
//     ],
//     "x-ms-enum": {
//       "name": "WorkloadNetworkName",
//       "modelAsString": true
//     },
//     "description": "Name for the workload network in the private cloud",
//     "x-ms-parameter-location": "method",
//     "pattern": "^[-\\w\\._]+$"
//   },
//   "provisionedNetworkName": {
//     "name": "provisionedNetworkName",
//     "in": "path",
//     "required": true,
//     "type": "string",
//     "description": "Name of the provisioned network in the private cloud",
//     "x-ms-parameter-location": "method"
//   }
// },
