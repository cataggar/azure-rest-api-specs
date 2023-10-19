using TypeSpec.Http;
using Azure.ResourceManager;

namespace Microsoft.AVS;

@doc("The parameter for the private cloud name.")
model PrivateCloudNameParameter {
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

@doc("The parameter for the cluster name.")
model HcxEnterpriseSiteNameParameter {
  @path
  @doc("Name of the HCX Enterprise Site in the private cloud.")
  @pattern("^[-\\w\\._]+$")
  hcxEnterpriseSiteName: string;
}

@doc("The parameter for the addon name.")
model AddonNameParameter {
  @path
  @doc("Name of the addon for the private cloud.")
  @pattern("^[-\\w\\._]+$")
  addonName: string;
}

@doc("The parameter for the ExpressRoute circuit authorization name.")
model AuthorizationNameParameter {
  @path
  @doc("Name of the ExpressRoute Circuit Authorization in the private cloud.")
  @pattern("^[-\\w\\._]+$")
  authorizationName: string;
}

@doc("The parameter for the global reach connection name.")
model GlobalReachConnectionNameParameter {
  @path
  @doc("Name of the global reach connection in the private cloud.")
  @pattern("^[-\\w\\._]+$")
  globalReachConnectionName: string;
}

@doc("The parameter for the segment ID.")
model SegmentIdParameter {
  @path
  @doc("NSX Segment identifier. Generally the same as the Segment's display name.")
  segmentId: string;
}

@doc("The parameter for the DHCP ID.")
model DhcpIdParameter {
  @path
  @doc("NSX DHCP identifier. Generally the same as the DHCP display name.")
  dhcpId: string;
}

@doc("The parameter for the port mirroring ID.")
model PortMirroringIdParameter {
  @path
  @doc("NSX Port Mirroring identifier. Generally the same as the Port Mirroring display name.")
  portMirroringId: string;
}

@doc("The parameter for the VM group ID.")
model VmGroupIdParameter {
  @path
  @doc("NSX VM Group identifier. Generally the same as the VM Group's display name.")
  vmGroupId: string;
}

@doc("The parameter for the virtual machine ID.")
model VirtualMachineIdParameter {
  @path
  @doc("Virtual Machine identifier.")
  virtualMachineId: string;
}

@doc("The parameter for the gateway ID.")
model GatewayIdParameter {
  @path
  @doc("NSX Gateway identifier. Generally the same as the Gateway's display name.")
  gatewayId: string;
}

@doc("The parameter for the DNS service ID.")
model DnsServiceIdParameter {
  @path
  @doc("NSX DNS Service identifier. Generally the same as the DNS Service's display name.")
  dnsServiceId: string;
}

@doc("The parameter for the DNS zone ID.")
model DnsZoneIdParameter {
  @path
  @doc("NSX DNS Zone identifier. Generally the same as the DNS Zone's display name.")
  dnsZoneId: string;
}

@doc("The parameter for the public IP ID.")
model PublicIpIdParameter {
  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @path
  @doc("NSX Public IP Block identifier. Generally the same as the Public IP Block's display name.")
  publicIPId: string;
}

@doc("The parameter for the datastore name.")
model DatastoreNameParameter {
  @path
  @doc("Name of the datastore in the private cloud cluster.")
  @pattern("^[-\\w\\._]+$")
  datastoreName: string;
}

@doc("The parameter for the cloud link name.")
model CloudLinkNameParameter {
  @path
  @doc("Name of the cloud link resource.")
  @pattern("^[-\\w\\._]+$")
  cloudLinkName: string;
}

@doc("The parameter for the placement policy name.")
model PlacementPolicyNameParameter {
  @path
  @doc("Name of the VMware vSphere Distributed Resource Scheduler (DRS) placement policy.")
  @pattern("^[-\\w\\._]+$")
  placementPolicyName: string;
}

@doc("The parameter for the script execution name.")
model ScriptExecutionNameParameter {
  @path
  @doc("Name of the user-invoked script execution resource.")
  @pattern("^[-\\w\\._]+$")
  scriptExecutionName: string;
}

@doc("The parameter for the script execution name.")
model ScriptPackageNameParameter {
  @path
  @doc("Name of the script package in the private cloud.")
  @pattern("^[-\\w\\._@]+$")
  scriptPackageName: string;
}

@doc("The parameter for the script cmdlet name.")
model ScriptCmdletNameParameter {
  @path
  @doc("Name of the script cmdlet resource in the script package in the private cloud.")
  @pattern("^[-\\w\\._]+$")
  scriptCmdletName: string;
}

@doc("The parameter for the script cmdlet name.")
model ScriptOutputStreamTypeParameter {
  @path
  @doc("Name of the script cmdlet resource in the script package in the private cloud.")
  scriptOutputStreamType: ScriptOutputStreamType;
}

@doc("The parameter for the script cmdlet name.")
model WorkloadNetworkParameter {
  @path
  @doc("Name of the script cmdlet resource in the script package in the private cloud.")
  @pattern("^[-\\w\\._]+$")
  // TODO Can pattern be used on WorkloadNetworkName instead?
  workloadNetworkName: WorkloadNetworkName | string;
}

@doc("The parameter for the script cmdlet name.")
model ProvisionedNetworkNameParameter {
  @path
  @doc("Name of the provisioned network in the private cloud.")
  provisionedNetworkName: string;
}
