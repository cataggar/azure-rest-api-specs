import "@azure-tools/typespec-azure-core";
import "@typespec/rest";
import "./models.tsp";
import "./parameters.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager;

namespace Microsoft.AVS;

interface OperationsOperations {
  @doc("Lists all of the available operations")
  @route("/providers/Microsoft.AVS/operations")
  @get
  List is Azure.Core.Foundations.Operation<{}, OperationList>;
}

interface LocationsOperations {
  @doc("Return trial status for subscription by region")
  @route("/subscriptions/{subscriptionId}/providers/Microsoft.AVS/locations/{location}/checkTrialAvailability")
  @post
  CheckTrialAvailability is Azure.Core.Foundations.Operation<
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
  CheckQuotaAvailability is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...LocationParameter;
    },
    Quota
  >;
}

interface PrivateCloudsOperations {
  @doc("List private clouds in a resource group")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
    },
    PrivateCloudList
  >;

  @doc("List private clouds in a subscription")
  @route("/subscriptions/{subscriptionId}/providers/Microsoft.AVS/privateClouds")
  @get
  ListInSubscription is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
    },
    PrivateCloudList
  >;

  @doc("Get a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    PrivateCloud
  >;

  @doc("Create or update a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("The private cloud")
      @body
      privateCloud: PrivateCloud;
    },
    PrivateCloud
  >;

  @doc("Update a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}")
  @patch
  Update is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("The private cloud properties to be updated")
      @body
      privateCloudUpdate: PrivateCloudUpdate;
    },
    PrivateCloud
  >;

  @doc("Delete a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    void
  >;

  @doc("Rotate the vCenter password")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/rotateVcenterPassword")
  @post
  RotateVcenterPassword is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    void
  >;

  @doc("Rotate the NSX-T Manager password")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/rotateNsxtPassword")
  @post
  RotateNsxtPassword is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    void
  >;

  @doc("List the admin credentials for the private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/listAdminCredentials")
  @post
  ListAdminCredentials is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    AdminCredentials
  >;
}

interface ClustersOperations {
  @doc("List clusters in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    ClusterList
  >;

  @doc("Get a cluster by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;
    },
    Cluster
  >;

  @doc("Create or update a cluster in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("The name of the private cloud.")
      @path
      privateCloudName: string;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("A cluster in the private cloud")
      @body
      cluster: Cluster;
    },
    Cluster
  >;

  @doc("Update a cluster in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}")
  @patch
  Update is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("The cluster properties to be updated")
      @body
      clusterUpdate: ClusterUpdate;
    },
    Cluster
  >;

  @doc("Delete a cluster in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;
    },
    void
  >;

  @doc("List hosts by zone in a cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/listZones")
  @post
  ListZones is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;
    },
    ClusterZoneList
  >;
}

interface DatastoresOperations {
  @doc("List datastores in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/datastores")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;
    },
    DatastoreList
  >;

  @doc("Get a datastore in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/datastores/{datastoreName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Name of the datastore in the private cloud cluster")
      @path
      datastoreName: string;
    },
    Datastore
  >;

  @doc("Create or update a datastore in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/datastores/{datastoreName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Name of the datastore in the private cloud cluster")
      @path
      datastoreName: string;

      @doc("A datastore in a private cloud cluster")
      @body
      datastore: Datastore;
    },
    Datastore
  >;

  @doc("Delete a datastore in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/datastores/{datastoreName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Name of the datastore in the private cloud cluster")
      @path
      datastoreName: string;
    },
    void
  >;
}

interface HcxEnterpriseSitesOperations {
  @doc("List HCX on-premises key in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/hcxEnterpriseSites")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    HcxEnterpriseSiteList
  >;

  @doc("Get an HCX on-premises key by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/hcxEnterpriseSites/{hcxEnterpriseSiteName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the HCX Enterprise Site in the private cloud")
      @path
      hcxEnterpriseSiteName: string;
    },
    HcxEnterpriseSite
  >;

  @doc("Create or update an activation key for on-premises HCX site")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/hcxEnterpriseSites/{hcxEnterpriseSiteName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("The name of the private cloud.")
      @path
      privateCloudName: string;

      @doc("Name of the HCX Enterprise Site in the private cloud")
      @path
      hcxEnterpriseSiteName: string;

      @doc("The HCX Enterprise Site")
      @body
      hcxEnterpriseSite: HcxEnterpriseSite;
    },
    HcxEnterpriseSite
  >;

  @doc("Delete HCX on-premises key in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/hcxEnterpriseSites/{hcxEnterpriseSiteName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the HCX Enterprise Site in the private cloud")
      @path
      hcxEnterpriseSiteName: string;
    },
    void
  >;
}

interface AuthorizationsOperations {
  @doc("List ExpressRoute Circuit Authorizations in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/authorizations")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    ExpressRouteAuthorizationList
  >;

  @doc("Get an ExpressRoute Circuit Authorization by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/authorizations/{authorizationName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the ExpressRoute Circuit Authorization in the private cloud")
      @path
      authorizationName: string;
    },
    ExpressRouteAuthorization
  >;

  @doc("Create or update an ExpressRoute Circuit Authorization in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/authorizations/{authorizationName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("The name of the private cloud.")
      @path
      privateCloudName: string;

      @doc("Name of the ExpressRoute Circuit Authorization in the private cloud")
      @path
      authorizationName: string;

      @doc("An ExpressRoute Circuit Authorization")
      @body
      authorization: ExpressRouteAuthorization;
    },
    ExpressRouteAuthorization
  >;

  @doc("Delete an ExpressRoute Circuit Authorization in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/authorizations/{authorizationName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the ExpressRoute Circuit Authorization in the private cloud")
      @path
      authorizationName: string;
    },
    void
  >;
}

interface GlobalReachConnectionsOperations {
  @doc("List global reach connections in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/globalReachConnections")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    GlobalReachConnectionList
  >;

  @doc("Get a global reach connection by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/globalReachConnections/{globalReachConnectionName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the global reach connection in the private cloud")
      @path
      globalReachConnectionName: string;
    },
    GlobalReachConnection
  >;

  @doc("Create or update a global reach connection in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/globalReachConnections/{globalReachConnectionName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("The name of the private cloud.")
      @path
      privateCloudName: string;

      @doc("Name of the global reach connection in the private cloud")
      @path
      globalReachConnectionName: string;

      @doc("A global reach connection in the private cloud")
      @body
      globalReachConnection: GlobalReachConnection;
    },
    GlobalReachConnection
  >;

  @doc("Delete a global reach connection in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/globalReachConnections/{globalReachConnectionName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the global reach connection in the private cloud")
      @path
      globalReachConnectionName: string;
    },
    void
  >;
}

interface WorkloadNetworksOperations {
  @doc("Get a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/{workloadNetworkName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name for the workload network in the private cloud")
      @path
      workloadNetworkName: WorkloadNetworkName;
    },
    WorkloadNetwork
  >;

  @doc("List of workload networks in a private cloud.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkList
  >;

  @doc("List of segments in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/segments")
  @get
  ListSegments is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkSegmentsList
  >;

  @doc("Get a segment by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/segments/{segmentId}")
  @get
  GetSegment is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX Segment identifier. Generally the same as the Segment's display name")
      @path
      segmentId: string;
    },
    WorkloadNetworkSegment
  >;

  @doc("Create a segment by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/segments/{segmentId}")
  @put
  CreateSegments is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX Segment identifier. Generally the same as the Segment's display name")
      @path
      segmentId: string;

      @doc("NSX Segment")
      @body
      workloadNetworkSegment: WorkloadNetworkSegment;
    },
    WorkloadNetworkSegment
  >;

  @doc("Create or update a segment by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/segments/{segmentId}")
  @patch
  UpdateSegments is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX Segment identifier. Generally the same as the Segment's display name")
      @path
      segmentId: string;

      @doc("NSX Segment")
      @body
      workloadNetworkSegment: WorkloadNetworkSegment;
    },
    WorkloadNetworkSegment | void
  >;

  @doc("Delete a segment by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/segments/{segmentId}")
  @delete
  DeleteSegment is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX Segment identifier. Generally the same as the Segment's display name")
      @path
      segmentId: string;
    },
    void
  >;

  @doc("List dhcp in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations")
  @get
  ListDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkDhcpList
  >;

  @doc("Get dhcp by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations/{dhcpId}")
  @get
  GetDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("NSX DHCP identifier. Generally the same as the DHCP display name")
      @path
      dhcpId: string;

      ...PrivateCloudParameter;
    },
    WorkloadNetworkDhcp
  >;

  @doc("Create dhcp by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations/{dhcpId}")
  @put
  CreateDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DHCP identifier. Generally the same as the DHCP display name")
      @path
      dhcpId: string;

      @doc("NSX DHCP")
      @body
      workloadNetworkDhcp: WorkloadNetworkDhcp;
    },
    WorkloadNetworkDhcp
  >;

  @doc("Create or update dhcp by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations/{dhcpId}")
  @patch
  UpdateDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DHCP identifier. Generally the same as the DHCP display name")
      @path
      dhcpId: string;

      @doc("NSX DHCP")
      @body
      workloadNetworkDhcp: WorkloadNetworkDhcp;
    },
    WorkloadNetworkDhcp | void
  >;

  @doc("Delete dhcp by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dhcpConfigurations/{dhcpId}")
  @delete
  DeleteDhcp is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DHCP identifier. Generally the same as the DHCP display name")
      @path
      dhcpId: string;
    },
    void
  >;

  @doc("List of gateways in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/gateways")
  @get
  ListGateways is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkGatewayList
  >;

  @doc("Get a gateway by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/gateways/{gatewayId}")
  @get
  GetGateway is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX Gateway identifier. Generally the same as the Gateway's display name")
      @path
      gatewayId: string;
    },
    WorkloadNetworkGateway
  >;

  @doc("List of port mirroring profiles in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles")
  @get
  ListPortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkPortMirroringList
  >;

  @doc("Get a port mirroring profile by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles/{portMirroringId}")
  @get
  GetPortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("""
NSX Port Mirroring identifier. Generally the same as the Port Mirroring display
name
""")
      @path
      portMirroringId: string;
    },
    WorkloadNetworkPortMirroring
  >;

  @doc("Create a port mirroring profile by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles/{portMirroringId}")
  @put
  CreatePortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("""
NSX Port Mirroring identifier. Generally the same as the Port Mirroring display
name
""")
      @path
      portMirroringId: string;

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
  UpdatePortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("""
NSX Port Mirroring identifier. Generally the same as the Port Mirroring display
name
""")
      @path
      portMirroringId: string;

      @doc("NSX port mirroring")
      @body
      workloadNetworkPortMirroring: WorkloadNetworkPortMirroring;
    },
    WorkloadNetworkPortMirroring | void
  >;

  @doc("Delete a port mirroring profile by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/portMirroringProfiles/{portMirroringId}")
  @delete
  DeletePortMirroring is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("""
NSX Port Mirroring identifier. Generally the same as the Port Mirroring display
name
""")
      @path
      portMirroringId: string;

      ...PrivateCloudParameter;
    },
    void
  >;

  @doc("List of vm groups in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups")
  @get
  ListVMGroups is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkVMGroupsList
  >;

  @doc("Get a vm group by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups/{vmGroupId}")
  @get
  GetVMGroup is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX VM Group identifier. Generally the same as the VM Group's display name")
      @path
      vmGroupId: string;
    },
    WorkloadNetworkVMGroup
  >;

  @doc("Create a vm group by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups/{vmGroupId}")
  @put
  CreateVMGroup is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX VM Group identifier. Generally the same as the VM Group's display name")
      @path
      vmGroupId: string;

      @doc("NSX VM Group")
      @body
      workloadNetworkVMGroup: WorkloadNetworkVMGroup;
    },
    WorkloadNetworkVMGroup
  >;

  @doc("Create or update a vm group by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups/{vmGroupId}")
  @patch
  UpdateVMGroup is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX VM Group identifier. Generally the same as the VM Group's display name")
      @path
      vmGroupId: string;

      @doc("NSX VM Group")
      @body
      workloadNetworkVMGroup: WorkloadNetworkVMGroup;
    },
    WorkloadNetworkVMGroup | void
  >;

  @doc("Delete a vm group by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/vmGroups/{vmGroupId}")
  @delete
  DeleteVMGroup is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("NSX VM Group identifier. Generally the same as the VM Group's display name")
      @path
      vmGroupId: string;

      ...PrivateCloudParameter;
    },
    void
  >;

  @doc("List of virtual machines in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/virtualMachines")
  @get
  ListVirtualMachines is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkVirtualMachinesList
  >;

  @doc("Get a virtual machine by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/virtualMachines/{virtualMachineId}")
  @get
  GetVirtualMachine is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Virtual Machine identifier")
      @path
      virtualMachineId: string;
    },
    WorkloadNetworkVirtualMachine
  >;

  @doc("List of DNS services in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices")
  @get
  ListDnsServices is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkDnsServicesList
  >;

  @doc("Get a DNS service by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices/{dnsServiceId}")
  @get
  GetDnsService is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DNS Service identifier. Generally the same as the DNS Service's display name")
      @path
      dnsServiceId: string;
    },
    WorkloadNetworkDnsService
  >;

  @doc("Create a DNS service by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices/{dnsServiceId}")
  @put
  CreateDnsService is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DNS Service identifier. Generally the same as the DNS Service's display name")
      @path
      dnsServiceId: string;

      @doc("NSX DNS Service")
      @body
      workloadNetworkDnsService: WorkloadNetworkDnsService;
    },
    WorkloadNetworkDnsService
  >;

  @doc("Create or update a DNS service by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices/{dnsServiceId}")
  @patch
  UpdateDnsService is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DNS Service identifier. Generally the same as the DNS Service's display name")
      @path
      dnsServiceId: string;

      @doc("NSX DNS Service")
      @body
      workloadNetworkDnsService: WorkloadNetworkDnsService;
    },
    WorkloadNetworkDnsService | void
  >;

  @doc("Delete a DNS service by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsServices/{dnsServiceId}")
  @delete
  DeleteDnsService is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("NSX DNS Service identifier. Generally the same as the DNS Service's display name")
      @path
      dnsServiceId: string;

      ...PrivateCloudParameter;
    },
    void
  >;

  @doc("List of DNS zones in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones")
  @get
  ListDnsZones is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkDnsZonesList
  >;

  @doc("Get a DNS zone by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones/{dnsZoneId}")
  @get
  GetDnsZone is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DNS Zone identifier. Generally the same as the DNS Zone's display name")
      @path
      dnsZoneId: string;
    },
    WorkloadNetworkDnsZone
  >;

  @doc("Create a DNS zone by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones/{dnsZoneId}")
  @put
  CreateDnsZone is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DNS Zone identifier. Generally the same as the DNS Zone's display name")
      @path
      dnsZoneId: string;

      @doc("NSX DNS Zone")
      @body
      workloadNetworkDnsZone: WorkloadNetworkDnsZone;
    },
    WorkloadNetworkDnsZone
  >;

  @doc("Create or update a DNS zone by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones/{dnsZoneId}")
  @patch
  UpdateDnsZone is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("NSX DNS Zone identifier. Generally the same as the DNS Zone's display name")
      @path
      dnsZoneId: string;

      @doc("NSX DNS Zone")
      @body
      workloadNetworkDnsZone: WorkloadNetworkDnsZone;
    },
    WorkloadNetworkDnsZone | void
  >;

  @doc("Delete a DNS zone by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/dnsZones/{dnsZoneId}")
  @delete
  DeleteDnsZone is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("NSX DNS Zone identifier. Generally the same as the DNS Zone's display name")
      @path
      dnsZoneId: string;

      ...PrivateCloudParameter;
    },
    void
  >;

  @doc("List of Public IP Blocks in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/publicIPs")
  @get
  ListPublicIPs is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    WorkloadNetworkPublicIPsList
  >;

  @doc("Get a Public IP Block by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/publicIPs/{publicIPId}")
  @get
  GetPublicIP is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("""
NSX Public IP Block identifier. Generally the same as the Public IP Block's
display name
""")
      @path
      publicIPId: string;
    },
    WorkloadNetworkPublicIP
  >;

  @doc("Create a Public IP Block by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/publicIPs/{publicIPId}")
  @put
  CreatePublicIP is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("""
NSX Public IP Block identifier. Generally the same as the Public IP Block's
display name
""")
      @path
      publicIPId: string;

      @doc("NSX Public IP Block")
      @body
      workloadNetworkPublicIP: WorkloadNetworkPublicIP;
    },
    WorkloadNetworkPublicIP
  >;

  @doc("Delete a Public IP Block by id in a private cloud workload network.")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/workloadNetworks/default/publicIPs/{publicIPId}")
  @delete
  DeletePublicIP is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("""
NSX Public IP Block identifier. Generally the same as the Public IP Block's
display name
""")
      @path
      publicIPId: string;

      ...PrivateCloudParameter;
    },
    void
  >;
}

interface CloudLinksOperations {
  @doc("List cloud link in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/cloudLinks")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    CloudLinkList
  >;

  @doc("Get an cloud link by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/cloudLinks/{cloudLinkName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cloud link resource")
      @path
      cloudLinkName: string;
    },
    CloudLink
  >;

  @doc("Create or update a cloud link in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/cloudLinks/{cloudLinkName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("The name of the private cloud.")
      @path
      privateCloudName: string;

      @doc("Name of the cloud link resource")
      @path
      cloudLinkName: string;

      @doc("A cloud link in the private cloud")
      @body
      cloudLink: CloudLink;
    },
    CloudLink
  >;

  @doc("Delete a cloud link in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/cloudLinks/{cloudLinkName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cloud link resource")
      @path
      cloudLinkName: string;
    },
    void
  >;
}

interface AddonsOperations {
  @doc("List addons in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/addons")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    AddonList
  >;

  @doc("Get an addon by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/addons/{addonName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the addon for the private cloud")
      @path
      addonName: string;
    },
    Addon
  >;

  @doc("Create or update a addon in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/addons/{addonName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("The name of the private cloud.")
      @path
      privateCloudName: string;

      @doc("Name of the addon for the private cloud")
      @path
      addonName: string;

      @doc("A addon in the private cloud")
      @body
      addon: Addon;
    },
    Addon
  >;

  @doc("Delete a addon in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/addons/{addonName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the addon for the private cloud")
      @path
      addonName: string;
    },
    void
  >;
}

interface VirtualMachinesOperations {
  @summary("List of virtual machines in a private cloud cluster")
  @doc("List of virtual machines in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/virtualMachines")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;
    },
    VirtualMachinesList
  >;

  @doc("Get a virtual machine by id in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/virtualMachines/{virtualMachineId}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Virtual Machine identifier")
      @path
      virtualMachineId: string;
    },
    VirtualMachine
  >;

  @doc("Enable or disable DRS-driven VM movement restriction")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/virtualMachines/{virtualMachineId}/restrictMovement")
  @post
  RestrictMovement is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Virtual Machine identifier")
      @path
      virtualMachineId: string;

      @doc("Whether VM DRS-driven movement is restricted (Enabled) or not (Disabled)")
      @body
      restrictMovement: VirtualMachineRestrictMovement;
    },
    void
  >;
}

interface PlacementPoliciesOperations {
  @doc("List placement policies in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;
    },
    PlacementPoliciesList
  >;

  @doc("Get a placement policy by name in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies/{placementPolicyName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Name of the VMware vSphere Distributed Resource Scheduler (DRS) placement policy")
      @path
      placementPolicyName: string;
    },
    PlacementPolicy
  >;

  @doc("Create or update a placement policy in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies/{placementPolicyName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Name of the VMware vSphere Distributed Resource Scheduler (DRS) placement policy")
      @path
      placementPolicyName: string;

      @doc("A placement policy in the private cloud cluster")
      @body
      placementPolicy: PlacementPolicy;
    },
    PlacementPolicy
  >;

  @doc("Update a placement policy in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies/{placementPolicyName}")
  @patch
  Update is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Name of the VMware vSphere Distributed Resource Scheduler (DRS) placement policy")
      @path
      placementPolicyName: string;

      @doc("The placement policy properties that may be updated")
      @body
      placementPolicyUpdate: PlacementPolicyUpdate;
    },
    PlacementPolicy
  >;

  @doc("Delete a placement policy in a private cloud cluster")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/clusters/{clusterName}/placementPolicies/{placementPolicyName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the cluster in the private cloud")
      @path
      clusterName: string;

      @doc("Name of the VMware vSphere Distributed Resource Scheduler (DRS) placement policy")
      @path
      placementPolicyName: string;
    },
    void
  >;
}

interface ScriptPackagesOperations {
  @doc("List script packages available to run on the private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptPackages")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    ScriptPackagesList
  >;

  @doc("Get a script package available to run on a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptPackages/{scriptPackageName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the script package in the private cloud")
      @path
      scriptPackageName: string;
    },
    ScriptPackage
  >;
}

interface ScriptCmdletsOperations {
  @doc("""
List script cmdlet resources available for a private cloud to create a script
execution resource on a private cloud
""")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptPackages/{scriptPackageName}/scriptCmdlets")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the script package in the private cloud")
      @path
      scriptPackageName: string;
    },
    ScriptCmdletsList
  >;

  @doc("""
Return information about a script cmdlet resource in a specific package on a
private cloud
""")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptPackages/{scriptPackageName}/scriptCmdlets/{scriptCmdletName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the script package in the private cloud")
      @path
      scriptPackageName: string;

      @doc("Name of the script cmdlet resource in the script package in the private cloud")
      @path
      scriptCmdletName: string;
    },
    ScriptCmdlet
  >;
}

interface ScriptExecutionsOperations {
  @doc("List script executions in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions")
  @get
  List is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;
    },
    ScriptExecutionsList
  >;

  @doc("Get an script execution by name in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions/{scriptExecutionName}")
  @get
  Get is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the user-invoked script execution resource")
      @path
      scriptExecutionName: string;
    },
    ScriptExecution
  >;

  @doc("Create or update a script execution in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions/{scriptExecutionName}")
  @put
  CreateOrUpdate is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;

      @doc("The name of the private cloud.")
      @path
      privateCloudName: string;

      @doc("Name of the user-invoked script execution resource")
      @path
      scriptExecutionName: string;

      @doc("A script running in the private cloud")
      @body
      scriptExecution: ScriptExecution;
    },
    ScriptExecution
  >;

  @doc("Cancel a ScriptExecution in a private cloud")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions/{scriptExecutionName}")
  @delete
  Delete is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the user-invoked script execution resource")
      @path
      scriptExecutionName: string;
    },
    void
  >;

  @doc("Return the logs for a script execution resource")
  @route("/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.AVS/privateClouds/{privateCloudName}/scriptExecutions/{scriptExecutionName}/getExecutionLogs")
  @post
  GetExecutionLogs is Azure.Core.Foundations.Operation<
    {
      ...SubscriptionIdParameter;
      ...ResourceGroupParameter;
      ...PrivateCloudParameter;

      @doc("Name of the user-invoked script execution resource")
      @path
      scriptExecutionName: string;

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
