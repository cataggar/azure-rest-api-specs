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
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/listAdminCredentials")
  @post
  listAdminCredentials is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    AdminCredentials
  >;
}

@armResourceOperations
interface Clusters {
  list is ArmResourceListByParent<Cluster>;
  get is ArmResourceRead<Cluster>;

  @doc("Create or update a cluster in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;

      @doc("A cluster in the private cloud")
      @body
      cluster: Cluster;
    },
    Cluster
  >;

  @doc("Update a cluster in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}")
  @patch
  update is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;

      @doc("The cluster properties to be updated")
      @body
      clusterUpdate: ClusterUpdate;
    },
    Cluster
  >;

  @doc("Delete a cluster in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
    },
    void
  >;

  @doc("List hosts by zone in a cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/listZones")
  @post
  listZones is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
    },
    ClusterZoneList
  >;
}

interface Datastores {
  @doc("List datastores in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/datastores")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
    },
    DatastoreList
  >;

  @doc("Get a datastore in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/datastores/{datastoreName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...DatastoreNameParameter;
    },
    Datastore
  >;

  @doc("Create or update a datastore in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/datastores/{datastoreName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...DatastoreNameParameter;

      @doc("A datastore in a private cloud cluster")
      @body
      datastore: Datastore;
    },
    Datastore
  >;

  @doc("Delete a datastore in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/datastores/{datastoreName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...ClusterNameParameter;
      ...DatastoreNameParameter;
    },
    void
  >;
}

interface HcxEnterpriseSites {
  @doc("List HCX on-premises key in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/hcxEnterpriseSites")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    HcxEnterpriseSiteList
  >;

  @doc("Get an HCX on-premises key by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/hcxEnterpriseSites/{hcxEnterpriseSiteName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...HcxEnterpriseSiteNameParameter;
    },
    HcxEnterpriseSite
  >;

  @doc("Create or update an activation key for on-premises HCX site")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/hcxEnterpriseSites/{hcxEnterpriseSiteName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...HcxEnterpriseSiteNameParameter;

      @doc("The HCX Enterprise Site")
      @body
      hcxEnterpriseSite: HcxEnterpriseSite;
    },
    HcxEnterpriseSite
  >;

  @doc("Delete HCX on-premises key in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/hcxEnterpriseSites/{hcxEnterpriseSiteName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...HcxEnterpriseSiteNameParameter;
    },
    void
  >;
}

interface Authorizations {
  @doc("List ExpressRoute Circuit Authorizations in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/authorizations")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    ExpressRouteAuthorizationList
  >;

  @doc("Get an ExpressRoute Circuit Authorization by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/authorizations/{authorizationName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...AuthorizationNameParameter;
    },
    ExpressRouteAuthorization
  >;

  @doc("Create or update an ExpressRoute Circuit Authorization in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/authorizations/{authorizationName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...AuthorizationNameParameter;

      @doc("An ExpressRoute Circuit Authorization")
      @body
      authorization: ExpressRouteAuthorization;
    },
    ExpressRouteAuthorization
  >;

  @doc("Delete an ExpressRoute Circuit Authorization in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/authorizations/{authorizationName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...AuthorizationNameParameter;
    },
    void
  >;
}

interface GlobalReachConnections {
  @doc("List global reach connections in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/globalReachConnections")
  @get
  list is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    GlobalReachConnectionList
  >;

  @doc("Get a global reach connection by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/globalReachConnections/{globalReachConnectionName}")
  @get
  get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...GlobalReachConnectionNameParameter;
    },
    GlobalReachConnection
  >;

  @doc("Create or update a global reach connection in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/globalReachConnections/{globalReachConnectionName}")
  @put
  createOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...GlobalReachConnectionNameParameter;

      @doc("A global reach connection in the private cloud")
      @body
      globalReachConnection: GlobalReachConnection;
    },
    GlobalReachConnection
  >;

  @doc("Delete a global reach connection in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/globalReachConnections/{globalReachConnectionName}")
  @delete
  delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...GlobalReachConnectionNameParameter;
    },
    void
  >;
}

interface WorkloadNetworks {
  get is ArmResourceRead<WorkloadNetwork>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_List")
  list is ArmResourceListByParent<WorkloadNetwork>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_ListSegments")
  listSegments is ArmResourceListByParent<WorkloadNetworkSegment>;

  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_GetSegment")
  getSegment is ArmResourceRead<WorkloadNetworkSegment>;
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "Can not change existing operationId."
  @operationId("WorkloadNetworks_CreateSegments")
  createSegment is ArmResourceCreateOrUpdateAsync<WorkloadNetworkSegment>;

  @doc("Create or update a segment by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/segments/{segmentId}")
  @patch
  updateSegments is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...SegmentIdParameter;

      @doc("NSX Segment")
      @body
      workloadNetworkSegment: WorkloadNetworkSegment;
    },
    WorkloadNetworkSegment | void
  >;

  @doc("Delete a segment by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/segments/{segmentId}")
  @delete
  deleteSegment is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...SegmentIdParameter;
    },
    void
  >;

  @doc("List dhcp in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations")
  @get
  listDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkDhcpList
  >;

  @doc("Get dhcp by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations/{dhcpId}")
  @get
  getDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...DhcpIdParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkDhcp
  >;

  @doc("Create dhcp by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations/{dhcpId}")
  @put
  createDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DhcpIdParameter;

      @doc("NSX DHCP")
      @body
      workloadNetworkDhcp: WorkloadNetworkDhcp;
    },
    WorkloadNetworkDhcp
  >;

  @doc("Create or update dhcp by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations/{dhcpId}")
  @patch
  updateDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DhcpIdParameter;

      @doc("NSX DHCP")
      @body
      workloadNetworkDhcp: WorkloadNetworkDhcp;
    },
    WorkloadNetworkDhcp | void
  >;

  @doc("Delete dhcp by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations/{dhcpId}")
  @delete
  deleteDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...DhcpIdParameter;
    },
    void
  >;

  @doc("List of gateways in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/gateways")
  @get
  listGateways is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkGatewayList
  >;

  @doc("Get a gateway by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/gateways/{gatewayId}")
  @get
  getGateway is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...GatewayIdParameter;
    },
    WorkloadNetworkGateway
  >;

  @doc("List of port mirroring profiles in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles")
  @get
  listPortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkPortMirroringList
  >;

  @doc("Get a port mirroring profile by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles/{portMirroringId}")
  @get
  getPortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...PortMirroringIdParameter;
    },
    WorkloadNetworkPortMirroring
  >;

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

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("List of vm groups in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups")
  @get
  listVMGroups is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
    },
    WorkloadNetworkVMGroupsList
  >;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("Get a vm group by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups/{vmGroupId}")
  @get
  getVMGroup is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...VmGroupIdParameter;
    },
    WorkloadNetworkVMGroup
  >;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("Create a vm group by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups/{vmGroupId}")
  @put
  createVMGroup is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...VmGroupIdParameter;

      @doc("NSX VM Group")
      @body
      workloadNetworkVMGroup: WorkloadNetworkVMGroup;
    },
    WorkloadNetworkVMGroup
  >;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("Create or update a vm group by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups/{vmGroupId}")
  @patch
  updateVMGroup is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudNameParameter;
      ...VmGroupIdParameter;

      @doc("NSX VM Group")
      @body
      workloadNetworkVMGroup: WorkloadNetworkVMGroup;
    },
    WorkloadNetworkVMGroup | void
  >;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("Delete a vm group by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups/{vmGroupId}")
  @delete
  deleteVMGroup is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...VmGroupIdParameter;
      ...PrivateCloudNameParameter;
    },
    void
  >;

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
