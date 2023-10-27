import "@azure-tools/typespec-azure-core";
import "@typespec/rest";
import "./models.tsp";
import "./parameters.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager;
using OpenAPI;

namespace Microsoft.AVS;

interface Operations extends Azure.ResourceManager.Operations {}

interface Locations {
  @doc("Return trial status for subscription by region")
  @route("/subscriptions/{subscriptionId}/providers/Microsoft.AVS/locations/{location}/checkTrialAvailability")
  @post
  checkTrialAvailability is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...LocationParameter;

      @doc("The sku to check for trial availability")
      @body
      sku: Sku;
    },
    Trial
  >;

  @doc("Return quota for subscription by region")
  @route("/subscriptions/{subscriptionId}/providers/Microsoft.AVS/locations/{location}/checkQuotaAvailability")
  @post
  checkQuotaAvailability is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...LocationParameter;
    },
    Quota
  >;
}

@armResourceOperations
interface PrivateClouds {
  list is ArmResourceListByParent<PrivateCloud>;
  listInSubscription is ArmListBySubscription<PrivateCloud>;
  get is ArmResourceRead<PrivateCloud>;
  createOrUpdate is ArmResourceCreateOrUpdateAsync<PrivateCloud>;
  update is ArmResourcePatchAsync<PrivateCloud, PrivateCloudUpdateProperties>;
  delete is ArmResourceDeleteAsync<PrivateCloud>;

  @doc("Rotate the vCenter password")
  rotateVcenterPassword is ArmResourceActionNoContentAsync<PrivateCloud, {}>;

  @doc("Rotate the NSX-T Manager password")
  rotateNsxtPassword is ArmResourceActionNoContentAsync<PrivateCloud, {}>;

  @doc("List the admin credentials for the private cloud")
  listAdminCredentials is ArmResourceActionSync<
    PrivateCloud,
    {},
    AdminCredentials
  >;
}

@armResourceOperations
interface Clusters {
  list is ArmResourceListByParent<Cluster>;
  get is ArmResourceRead<Cluster>;
  createOrUpdate is ArmResourceCreateOrUpdateAsync<Cluster>;
  update is ArmResourcePatchAsync<Cluster, ClusterUpdateProperties>;
  delete is ArmResourceDeleteAsync<Cluster>;

  @doc("List hosts by zone in a cluster")
  listZones is ArmResourceActionSync<Cluster, {}, ClusterZoneList>;
}

interface Datastores {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("Datastores_List")
  list is ArmResourceListByParent<Datastore>;

  get is ArmResourceRead<Datastore>;
  createOrUpdate is ArmResourceCreateOrUpdateAsync<Datastore>;
  delete is ArmResourceDeleteAsync<Datastore>;
}

interface HcxEnterpriseSites {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("HcxEnterpriseSites_List")
  list is ArmResourceListByParent<HcxEnterpriseSite>;

  get is ArmResourceRead<HcxEnterpriseSite>;
  createOrUpdate is ArmResourceCreateOrUpdateAsync<HcxEnterpriseSite>;
  delete is ArmResourceDeleteAsync<HcxEnterpriseSite>;
}

interface Authorizations {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("Authorizations_List")
  list is ArmResourceListByParent<ExpressRouteAuthorization>;

  get is ArmResourceRead<ExpressRouteAuthorization>;
  createOrUpdate is ArmResourceCreateOrUpdateAsync<ExpressRouteAuthorization>;
  delete is ArmResourceDeleteAsync<ExpressRouteAuthorization>;
}

interface GlobalReachConnections {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("GlobalReachConnections_List")
  list is ArmResourceListByParent<GlobalReachConnection>;

  get is ArmResourceRead<GlobalReachConnection>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<GlobalReachConnection>;

  delete is ArmResourceDeleteAsync<GlobalReachConnection>;
}

interface WorkloadNetworks {
  get is ArmResourceRead<WorkloadNetwork>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_List")
  list is ArmResourceListByParent<WorkloadNetwork>;
}

interface WorkloadNetworkSegments {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListSegments")
  listSegments is ArmResourceListByParent<WorkloadNetworkSegment>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetSegment")
  getSegment is ArmResourceRead<WorkloadNetworkSegment>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreateSegments")
  createSegment is ArmResourceCreateOrUpdateAsync<WorkloadNetworkSegment>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_UpdateSegments")
  updateSegment is ArmResourcePatchAsync<
    WorkloadNetworkSegment,
    WorkloadNetworkSegmentProperties
  >;

  deleteSegment is ArmResourceDeleteAsync<WorkloadNetworkSegment>;
}

interface WorkloadNetworkDhcps {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListDhcp")
  listDhcp is ArmResourceListByParent<WorkloadNetworkDhcp>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetDhcp")
  getDhcp is ArmResourceRead<WorkloadNetworkDhcp>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreateDhcp")
  createDhcp is ArmResourceCreateOrUpdateAsync<WorkloadNetworkDhcp>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_UpdateDhcp")
  updateDhcp is ArmResourcePatchAsync<
    WorkloadNetworkDhcp,
    WorkloadNetworkDhcpEntity
  >;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_DeleteDhcp")
  deleteDhcp is ArmResourceDeleteAsync<WorkloadNetworkDhcp>;
}

interface WorkloadNetworkGateways {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListGateways")
  listGateways is ArmResourceListByParent<WorkloadNetworkGateway>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetGateway")
  getGateway is ArmResourceRead<WorkloadNetworkGateway>;
}

interface WorkloadNetworkPortMirroringProfiles {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListPortMirroring")
  listPortMirroring is ArmResourceListByParent<WorkloadNetworkPortMirroring>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetPortMirrroring")
  getPortMirroring is ArmResourceRead<WorkloadNetworkPortMirroring>;

  @doc("Create a port mirroring profile by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles/{portMirroringId}")
  @put
  createPortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...PortMirroringIdParameter;

      @doc("NSX port mirroring")
      @body
      workloadNetworkPortMirroring: WorkloadNetworkPortMirroring;
    },
    WorkloadNetworkPortMirroring
  >;

  @doc("""
Create or update a port mirroring profile by id in a private cloud workload
network.
""")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles/{portMirroringId}")
  @patch
  updatePortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...PortMirroringIdParameter;

      @doc("NSX port mirroring")
      @body
      workloadNetworkPortMirroring: WorkloadNetworkPortMirroring;
    },
    WorkloadNetworkPortMirroring | void
  >;

  @doc("Delete a port mirroring profile by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles/{portMirroringId}")
  @delete
  deletePortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PortMirroringIdParameter;
      ...PrivateCloudNameParameter;
    },
    void
  >;
}

interface WorkloadNetworkVmGroups {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListVMGroups")
  list is ArmResourceListByParent<WorkloadNetworkVMGroup>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetVMGroup")
  get is ArmResourceRead<WorkloadNetworkVMGroup>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreateVMGroup")
  create is ArmResourceCreateOrUpdateAsync<WorkloadNetworkVMGroup>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_UpdateVMGroup")
  update is ArmResourcePatchAsync<
    WorkloadNetworkVMGroup,
    WorkloadNetworkVMGroupProperties
  >;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_DeleteVMGroup")
  delete is ArmResourceDeleteAsync<WorkloadNetworkVMGroup>;
}

interface WorkloadNetworkVirtualMachines {
  @doc("List of virtual machines in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/virtualMachines")
  @get
  listVirtualMachines is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkVirtualMachinesList
  >;

  @doc("Get a virtual machine by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/virtualMachines/{virtualMachineId}")
  @get
  getVirtualMachine is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...VirtualMachineIdParameter;
    },
    WorkloadNetworkVirtualMachine
  >;
}

interface WorkloadNetworkDnsServices {
  @doc("List of DNS services in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices")
  @get
  listDnsServices is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkDnsServicesList
  >;

  @doc("Get a DNS service by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices/{dnsServiceId}")
  @get
  getDnsService is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DnsServiceIdParameter;
    },
    WorkloadNetworkDnsService
  >;

  @doc("Create a DNS service by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices/{dnsServiceId}")
  @put
  createDnsService is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DnsServiceIdParameter;

      @doc("NSX DNS Service")
      @body
      workloadNetworkDnsService: WorkloadNetworkDnsService;
    },
    WorkloadNetworkDnsService
  >;

  @doc("Create or update a DNS service by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices/{dnsServiceId}")
  @patch
  updateDnsService is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DnsServiceIdParameter;

      @doc("NSX DNS Service")
      @body
      workloadNetworkDnsService: WorkloadNetworkDnsService;
    },
    WorkloadNetworkDnsService | void
  >;

  @doc("Delete a DNS service by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices/{dnsServiceId}")
  @delete
  deleteDnsService is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...DnsServiceIdParameter;
      ...PrivateCloudNameParameter;
    },
    void
  >;
}

interface WorkloadNetworkDnsZones {
  @doc("List of DNS zones in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones")
  @get
  listDnsZones is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkDnsZonesList
  >;

  @doc("Get a DNS zone by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones/{dnsZoneId}")
  @get
  getDnsZone is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DnsZoneIdParameter;
    },
    WorkloadNetworkDnsZone
  >;

  @doc("Create a DNS zone by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones/{dnsZoneId}")
  @put
  createDnsZone is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DnsZoneIdParameter;

      @doc("NSX DNS Zone")
      @body
      workloadNetworkDnsZone: WorkloadNetworkDnsZone;
    },
    WorkloadNetworkDnsZone
  >;

  @doc("Create or update a DNS zone by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones/{dnsZoneId}")
  @patch
  updateDnsZone is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DnsZoneIdParameter;

      @doc("NSX DNS Zone")
      @body
      workloadNetworkDnsZone: WorkloadNetworkDnsZone;
    },
    WorkloadNetworkDnsZone | void
  >;

  @doc("Delete a DNS zone by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones/{dnsZoneId}")
  @delete
  deleteDnsZone is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...DnsZoneIdParameter;
      ...PrivateCloudNameParameter;
    },
    void
  >;
}

interface WorkloadNetworkPublicIps {
  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("List of Public IP Blocks in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/publicIPs")
  @get
  listPublicIPs is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkPublicIPsList
  >;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("Get a Public IP Block by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/publicIPs/{publicIPId}")
  @get
  getPublicIP is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...PublicIpIdParameter;
    },
    WorkloadNetworkPublicIP
  >;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("Create a Public IP Block by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/publicIPs/{publicIPId}")
  @put
  createPublicIP is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...PublicIpIdParameter;

      @doc("NSX Public IP Block")
      @body
      workloadNetworkPublicIP: WorkloadNetworkPublicIP;
    },
    WorkloadNetworkPublicIP
  >;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("Delete a Public IP Block by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/publicIPs/{publicIPId}")
  @delete
  deletePublicIP is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PublicIpIdParameter;
      ...PrivateCloudNameParameter;
    },
    void
  >;
}

interface CloudLinks {
  @doc("List cloud link in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/cloudLinks")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    CloudLinkList
  >;

  @doc("Get an cloud link by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/cloudLinks/{cloudLinkName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...CloudLinkNameParameter;
    },
    CloudLink
  >;

  @doc("Create or update a cloud link in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/cloudLinks/{cloudLinkName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...CloudLinkNameParameter;

      @doc("A cloud link in the private cloud")
      @body
      cloudLink: CloudLink;
    },
    CloudLink
  >;

  @doc("Delete a cloud link in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/cloudLinks/{cloudLinkName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...CloudLinkNameParameter;
    },
    void
  >;
}

interface Addons {
  @doc("List addons in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/addons")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    AddonList
  >;

  @doc("Get an addon by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/addons/{addonName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...AddonNameParameter;
    },
    Addon
  >;

  @doc("Create or update a addon in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/addons/{addonName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...AddonNameParameter;

      @doc("A addon in the private cloud")
      @body
      addon: Addon;
    },
    Addon
  >;

  @doc("Delete a addon in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/addons/{addonName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...AddonNameParameter;
    },
    void
  >;
}

interface VirtualMachines {
  @summary("List of virtual machines in a private cloud cluster")
  @doc("List of virtual machines in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/virtualMachines")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
    },
    VirtualMachinesList
  >;

  @doc("Get a virtual machine by id in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/virtualMachines/{virtualMachineId}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...VirtualMachineIdParameter;
    },
    VirtualMachine
  >;

  @doc("Enable or disable DRS-driven VM movement restriction")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/virtualMachines/{virtualMachineId}/restrictMovement")
  @post
  restrictMovement is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...VirtualMachineIdParameter;

      @doc("Whether VM DRS-driven movement is restricted (Enabled) or not (Disabled)")
      @body
      restrictMovement: VirtualMachineRestrictMovement;
    },
    void
  >;
}

interface PlacementPolicies {
  @doc("List placement policies in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
    },
    PlacementPoliciesList
  >;

  @doc("Get a placement policy by name in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies/{placementPolicyName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...PlacementPolicyNameParameter;
    },
    PlacementPolicy
  >;

  @doc("Create or update a placement policy in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies/{placementPolicyName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...PlacementPolicyNameParameter;

      @doc("A placement policy in the private cloud cluster")
      @body
      placementPolicy: PlacementPolicy;
    },
    PlacementPolicy
  >;

  @doc("Update a placement policy in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies/{placementPolicyName}")
  @patch
  update is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...PlacementPolicyNameParameter;

      @doc("The placement policy properties that may be updated")
      @body
      placementPolicyUpdate: PlacementPolicyUpdate;
    },
    PlacementPolicy
  >;

  @doc("Delete a placement policy in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies/{placementPolicyName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...PlacementPolicyNameParameter;
    },
    void
  >;
}

interface ScriptPackages {
  @doc("List script packages available to run on the private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptPackages")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    ScriptPackagesList
  >;

  @doc("Get a script package available to run on a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptPackages/{scriptPackageName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ScriptPackageNameParameter;
    },
    ScriptPackage
  >;
}

interface ScriptCmdlets {
  @doc("""
List script cmdlet resources available for a private cloud to create a script
execution resource on a private cloud
""")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptPackages/{scriptPackageName}/scriptCmdlets")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ScriptPackageNameParameter;
    },
    ScriptCmdletsList
  >;

  @doc("""
Return information about a script cmdlet resource in a specific package on a
private cloud
""")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptPackages/{scriptPackageName}/scriptCmdlets/{scriptCmdletName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ScriptPackageNameParameter;
      ...ScriptCmdletNameParameter;
    },
    ScriptCmdlet
  >;
}

interface ScriptExecutions {
  @doc("List script executions in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    ScriptExecutionsList
  >;

  @doc("Get an script execution by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions/{scriptExecutionName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ScriptExecutionNameParameter;
    },
    ScriptExecution
  >;

  @doc("Create or update a script execution in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions/{scriptExecutionName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ScriptExecutionNameParameter;

      @doc("A script running in the private cloud")
      @body
      scriptExecution: ScriptExecution;
    },
    ScriptExecution
  >;

  @doc("Cancel a ScriptExecution in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions/{scriptExecutionName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ScriptExecutionNameParameter;
    },
    void
  >;

  @doc("Return the logs for a script execution resource")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions/{scriptExecutionName}/getExecutionLogs")
  @post
  getExecutionLogs is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ScriptExecutionNameParameter;

      #suppress "@azure-tools/typespec-azure-core/request-body-problem" "Can not change existing response."
      @doc("""
Name of the desired output stream to return. If not provided, will return all.
An empty array will return nothing
""")
      @body
      scriptOutputStreamType: ScriptOutputStreamType[];
    },
    ScriptExecution
  >;
}
