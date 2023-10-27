import "@azure-tools/typespec-azure-core";
import "@typespec/rest";
import "./models.tsp";

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

@armResourceOperations
interface Datastores {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("Datastores_List")
  list is ArmResourceListByParent<Datastore>;

  get is ArmResourceRead<Datastore>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<Datastore>;

  delete is ArmResourceDeleteAsync<Datastore>;
}

@armResourceOperations
interface HcxEnterpriseSites {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("HcxEnterpriseSites_List")
  list is ArmResourceListByParent<HcxEnterpriseSite>;

  get is ArmResourceRead<HcxEnterpriseSite>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<HcxEnterpriseSite>;

  delete is ArmResourceDeleteAsync<HcxEnterpriseSite>;
}

@armResourceOperations
interface Authorizations {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("Authorizations_List")
  list is ArmResourceListByParent<ExpressRouteAuthorization>;

  get is ArmResourceRead<ExpressRouteAuthorization>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<ExpressRouteAuthorization>;

  delete is ArmResourceDeleteAsync<ExpressRouteAuthorization>;
}

@armResourceOperations
interface GlobalReachConnections {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("GlobalReachConnections_List")
  list is ArmResourceListByParent<GlobalReachConnection>;

  get is ArmResourceRead<GlobalReachConnection>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<GlobalReachConnection>;

  delete is ArmResourceDeleteAsync<GlobalReachConnection>;
}

@armResourceOperations
interface WorkloadNetworks {
  get is ArmResourceRead<WorkloadNetwork>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_List")
  list is ArmResourceListByParent<WorkloadNetwork>;
}

@armResourceOperations
interface WorkloadNetworkSegments {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListSegments")
  list is ArmResourceListByParent<WorkloadNetworkSegment>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetSegment")
  get is ArmResourceRead<WorkloadNetworkSegment>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreateSegments")
  create is ArmResourceCreateOrUpdateAsync<WorkloadNetworkSegment>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_UpdateSegments")
  update is ArmResourcePatchAsync<
    WorkloadNetworkSegment,
    WorkloadNetworkSegmentProperties
  >;

  deleteSegment is ArmResourceDeleteAsync<WorkloadNetworkSegment>;
}

@armResourceOperations
interface WorkloadNetworkDhcps {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListDhcp")
  list is ArmResourceListByParent<WorkloadNetworkDhcp>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetDhcp")
  get is ArmResourceRead<WorkloadNetworkDhcp>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreateDhcp")
  create is ArmResourceCreateOrUpdateAsync<WorkloadNetworkDhcp>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_UpdateDhcp")
  update is ArmResourcePatchAsync<
    WorkloadNetworkDhcp,
    WorkloadNetworkDhcpEntity
  >;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_DeleteDhcp")
  delete is ArmResourceDeleteAsync<WorkloadNetworkDhcp>;
}

@armResourceOperations
interface WorkloadNetworkGateways {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListGateways")
  list is ArmResourceListByParent<WorkloadNetworkGateway>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetGateway")
  get is ArmResourceRead<WorkloadNetworkGateway>;
}

@armResourceOperations
interface WorkloadNetworkPortMirroringProfiles {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListPortMirroring")
  list is ArmResourceListByParent<WorkloadNetworkPortMirroring>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetPortMirrroring")
  get is ArmResourceRead<WorkloadNetworkPortMirroring>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreatePortMirroring")
  create is ArmResourceCreateOrUpdateAsync<WorkloadNetworkPortMirroring>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_UpdatePortMirroring")
  update is ArmResourcePatchAsync<
    WorkloadNetworkPortMirroring,
    WorkloadNetworkPortMirroringProperties
  >;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_DeletePortMirroring")
  delete is ArmResourceDeleteAsync<WorkloadNetworkPortMirroring>;
}

@armResourceOperations
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

@armResourceOperations
interface WorkloadNetworkVirtualMachines {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListVirtualMachines")
  list is ArmResourceListByParent<WorkloadNetworkVirtualMachine>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetVMGroup")
  get is ArmResourceRead<WorkloadNetworkVirtualMachine>;
}

@armResourceOperations
interface WorkloadNetworkDnsServices {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListDnsServices")
  list is ArmResourceListByParent<WorkloadNetworkDnsService>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetDnsService")
  get is ArmResourceRead<WorkloadNetworkDnsService>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreateDnsService")
  create is ArmResourceCreateOrUpdateAsync<WorkloadNetworkDnsService>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_UpdateDnsService")
  update is ArmResourcePatchAsync<
    WorkloadNetworkDnsService,
    WorkloadNetworkDnsServiceProperties
  >;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_DeleteDnsService")
  delete is ArmResourceDeleteAsync<WorkloadNetworkDnsService>;
}

@armResourceOperations
interface WorkloadNetworkDnsZones {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListDnsZones")
  list is ArmResourceListByParent<WorkloadNetworkDnsZone>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetDnsZone")
  get is ArmResourceRead<WorkloadNetworkDnsZone>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreateDnsZone")
  create is ArmResourceCreateOrUpdateAsync<WorkloadNetworkDnsZone>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_UpdateDnsZone")
  update is ArmResourcePatchAsync<
    WorkloadNetworkDnsZone,
    WorkloadNetworkDnsZoneProperties
  >;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_DeleteDnsZone")
  delete is ArmResourceDeleteAsync<WorkloadNetworkDnsZone>;
}

@armResourceOperations
interface WorkloadNetworkPublicIps {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListPublicIPs")
  list is ArmResourceListByParent<WorkloadNetworkPublicIP>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetPublicIP")
  get is ArmResourceRead<WorkloadNetworkPublicIP>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreatePublicIP")
  create is ArmResourceCreateOrUpdateAsync<WorkloadNetworkPublicIP>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_DeletePublicIP")
  delete is ArmResourceDeleteAsync<WorkloadNetworkPublicIP>;
}

@armResourceOperations
interface CloudLinks {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("CloudLinks_List")
  list is ArmResourceListByParent<CloudLink>;

  get is ArmResourceRead<CloudLink>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<CloudLink>;

  delete is ArmResourceDeleteAsync<CloudLink>;
}

@armResourceOperations
interface Addons {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("CloudLinks_List")
  list is ArmResourceListByParent<Addon>;

  get is ArmResourceRead<Addon>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<Addon>;

  delete is ArmResourceDeleteAsync<Addon>;
}

@armResourceOperations
interface VirtualMachines {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("VirtualMachines_List")
  list is ArmResourceListByParent<VirtualMachine>;

  get is ArmResourceRead<VirtualMachine>;

  @doc("Enable or disable DRS-driven VM movement restriction")
  restrictMovement is ArmResourceActionAsync<
    VirtualMachine,
    VirtualMachineRestrictMovement,
    {}
  >;
}

@armResourceOperations
interface PlacementPolicies {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("PlacementPolicies_List")
  list is ArmResourceListByParent<PlacementPolicy>;

  get is ArmResourceRead<PlacementPolicy>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<PlacementPolicy>;

  update is ArmResourcePatchAsync<PlacementPolicy, PlacementPolicyProperties>;
}

@armResourceOperations
interface ScriptPackages {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("ScriptPackages_List")
  list is ArmResourceListByParent<ScriptPackage>;

  get is ArmResourceRead<ScriptPackage>;
}

@armResourceOperations
interface ScriptCmdlets {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("ScriptCmdlets_List")
  list is ArmResourceListByParent<ScriptCmdlet>;

  get is ArmResourceRead<ScriptCmdlet>;
}

@armResourceOperations
interface ScriptExecutions {
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("ScriptExecutions_List")
  list is ArmResourceListByParent<ScriptExecution>;

  get is ArmResourceRead<ScriptExecution>;

  createOrUpdate is ArmResourceCreateOrUpdateAsync<ScriptExecution>;

  delete is ArmResourceDeleteAsync<ScriptExecution>;

  @doc("Return the logs for a script execution resource")
  getExecutionLogs is ArmResourceActionSync<
    ScriptExecution,
    ScriptOutputStreamType[],
    ScriptExecution
  >;
}
