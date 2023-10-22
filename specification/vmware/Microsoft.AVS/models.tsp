import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.ResourceManager;

namespace Microsoft.AVS;

@doc("TrialStatus")
enum TrialStatus {
  @doc("TrialAvailable")
  TrialAvailable,

  @doc("TrialUsed")
  TrialUsed,

  @doc("TrialDisabled")
  TrialDisabled,
}

@doc("QuotaEnabled")
enum QuotaEnabled {
  @doc("Enabled")
  Enabled,

  @doc("Disabled")
  Disabled,
}

@doc("PrivateCloudProvisioningState")
enum PrivateCloudProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Cancelled")
  Cancelled,

  @doc("Pending")
  Pending,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("NsxPublicIpQuotaRaisedEnum")
enum NsxPublicIpQuotaRaisedEnum {
  @doc("Enabled")
  Enabled,

  @doc("Disabled")
  Disabled,
}

@doc("ClusterProvisioningState")
enum ClusterProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Cancelled")
  Cancelled,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("InternetEnum")
enum InternetEnum {
  @doc("Enabled")
  Enabled,

  @doc("Disabled")
  Disabled,
}

@doc("SslEnum")
enum SslEnum {
  @doc("Enabled")
  Enabled,

  @doc("Disabled")
  Disabled,
}

@doc("AvailabilityStrategy")
enum AvailabilityStrategy {
  @doc("SingleZone")
  SingleZone,

  @doc("DualZone")
  DualZone,
}

@doc("EncryptionState")
enum EncryptionState {
  @doc("Enabled")
  Enabled,

  @doc("Disabled")
  Disabled,
}

@doc("EncryptionKeyStatus")
enum EncryptionKeyStatus {
  @doc("Connected")
  Connected,

  @doc("AccessDenied")
  AccessDenied,
}

@doc("EncryptionVersionType")
enum EncryptionVersionType {
  @doc("Fixed")
  Fixed,

  @doc("AutoDetected")
  AutoDetected,
}

@doc("ResourceIdentityType")
enum ResourceIdentityType {
  @doc("SystemAssigned")
  SystemAssigned,

  @doc("None")
  None,
}

@doc("DatastoreProvisioningState")
enum DatastoreProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Cancelled")
  Cancelled,

  @doc("Pending")
  Pending,

  @doc("Creating")
  Creating,

  @doc("Updating")
  Updating,

  @doc("Deleting")
  Deleting,

  @doc("Canceled")
  Canceled,
}

@doc("MountOptionEnum")
enum MountOptionEnum {
  @doc("MOUNT")
  MOUNT,

  @doc("ATTACH")
  ATTACH,
}

@doc("DatastoreStatus")
enum DatastoreStatus {
  @doc("Unknown")
  Unknown,

  @doc("Accessible")
  Accessible,

  @doc("Inaccessible")
  Inaccessible,

  @doc("Attached")
  Attached,

  @doc("Detached")
  Detached,

  @doc("LostCommunication")
  LostCommunication,

  @doc("DeadOrError")
  DeadOrError,
}

@doc("HcxEnterpriseSiteStatus")
enum HcxEnterpriseSiteStatus {
  @doc("Available")
  Available,

  @doc("Consumed")
  Consumed,

  @doc("Deactivated")
  Deactivated,

  @doc("Deleted")
  Deleted,
}

@doc("ExpressRouteAuthorizationProvisioningState")
enum ExpressRouteAuthorizationProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("GlobalReachConnectionProvisioningState")
enum GlobalReachConnectionProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("GlobalReachConnectionStatus")
enum GlobalReachConnectionStatus {
  @doc("Connected")
  Connected,

  @doc("Connecting")
  Connecting,

  @doc("Disconnected")
  Disconnected,
}

@doc("WorkloadNetworkName")
enum WorkloadNetworkName {
  @doc("default")
  default,
}

@doc("SegmentStatusEnum")
enum SegmentStatusEnum {
  @doc("SUCCESS")
  SUCCESS,

  @doc("FAILURE")
  FAILURE,
}

@doc("WorkloadNetworkSegmentProvisioningState")
enum WorkloadNetworkSegmentProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("DhcpTypeEnum")
enum DhcpTypeEnum {
  @doc("SERVER")
  SERVER,

  @doc("RELAY")
  RELAY,
}

@doc("WorkloadNetworkDhcpProvisioningState")
enum WorkloadNetworkDhcpProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("PortMirroringDirectionEnum")
enum PortMirroringDirectionEnum {
  @doc("INGRESS")
  INGRESS,

  @doc("EGRESS")
  EGRESS,

  @doc("BIDIRECTIONAL")
  BIDIRECTIONAL,
}

@doc("PortMirroringStatusEnum")
enum PortMirroringStatusEnum {
  @doc("SUCCESS")
  SUCCESS,

  @doc("FAILURE")
  FAILURE,
}

@doc("WorkloadNetworkPortMirroringProvisioningState")
enum WorkloadNetworkPortMirroringProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("VMGroupStatusEnum")
enum VMGroupStatusEnum {
  @doc("SUCCESS")
  SUCCESS,

  @doc("FAILURE")
  FAILURE,
}

@doc("WorkloadNetworkVMGroupProvisioningState")
enum WorkloadNetworkVMGroupProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("VMTypeEnum")
enum VMTypeEnum {
  @doc("REGULAR")
  REGULAR,

  @doc("EDGE")
  EDGE,

  @doc("SERVICE")
  SERVICE,
}

@doc("DnsServiceLogLevelEnum")
enum DnsServiceLogLevelEnum {
  @doc("DEBUG")
  DEBUG,

  @doc("INFO")
  INFO,

  @doc("WARNING")
  WARNING,

  @doc("ERROR")
  ERROR,

  @doc("FATAL")
  FATAL,
}

@doc("DnsServiceStatusEnum")
enum DnsServiceStatusEnum {
  @doc("SUCCESS")
  SUCCESS,

  @doc("FAILURE")
  FAILURE,
}

@doc("WorkloadNetworkDnsServiceProvisioningState")
enum WorkloadNetworkDnsServiceProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("WorkloadNetworkDnsZoneProvisioningState")
enum WorkloadNetworkDnsZoneProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("WorkloadNetworkPublicIPProvisioningState")
enum WorkloadNetworkPublicIPProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("CloudLinkStatus")
enum CloudLinkStatus {
  @doc("Active")
  Active,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Failed")
  Failed,

  @doc("Disconnected")
  Disconnected,
}

@doc("AddonType")
enum AddonType {
  @doc("SRM")
  SRM,

  @doc("VR")
  VR,

  @doc("HCX")
  HCX,

  @doc("Arc")
  Arc,
}

@doc("AddonProvisioningState")
enum AddonProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Cancelled")
  Cancelled,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("VirtualMachineRestrictMovementState")
enum VirtualMachineRestrictMovementState {
  @doc("Enabled")
  Enabled,

  @doc("Disabled")
  Disabled,
}

@doc("PlacementPolicyType")
enum PlacementPolicyType {
  @doc("VmVm")
  VmVm,

  @doc("VmHost")
  VmHost,
}

@doc("PlacementPolicyState")
enum PlacementPolicyState {
  @doc("Enabled")
  Enabled,

  @doc("Disabled")
  Disabled,
}

@doc("PlacementPolicyProvisioningState")
enum PlacementPolicyProvisioningState {
  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Building")
  Building,

  @doc("Deleting")
  Deleting,

  @doc("Updating")
  Updating,

  @doc("Canceled")
  Canceled,
}

@doc("AffinityStrength")
enum AffinityStrength {
  @doc("Should")
  Should,

  @doc("Must")
  Must,
}

@doc("AzureHybridBenefitType")
enum AzureHybridBenefitType {
  @doc("SqlHost")
  SqlHost,

  @doc("None")
  None,
}

@doc("ScriptParameterTypes")
enum ScriptParameterTypes {
  @doc("String")
  String,

  @doc("SecureString")
  SecureString,

  @doc("Credential")
  Credential,

  @doc("Int")
  Int,

  @doc("Bool")
  Bool,

  @doc("Float")
  Float,
}

@doc("VisibilityParameterEnum")
enum VisibilityParameterEnum {
  @doc("Visible")
  Visible,

  @doc("Hidden")
  Hidden,
}

@doc("OptionalParamEnum")
enum OptionalParamEnum {
  @doc("Optional")
  Optional,

  @doc("Required")
  Required,
}

@doc("ScriptExecutionParameterType")
enum ScriptExecutionParameterType {
  @doc("Value")
  Value,

  @doc("SecureValue")
  SecureValue,

  @doc("Credential")
  Credential,
}

@doc("ScriptExecutionProvisioningState")
enum ScriptExecutionProvisioningState {
  @doc("Pending")
  Pending,

  @doc("Running")
  Running,

  @doc("Succeeded")
  Succeeded,

  @doc("Failed")
  Failed,

  @doc("Cancelling")
  Cancelling,

  @doc("Cancelled")
  Cancelled,

  @doc("Deleting")
  Deleting,

  @doc("Canceled")
  Canceled,
}

@doc("ScriptOutputStreamType")
enum ScriptOutputStreamType {
  @doc("Information")
  Information,

  @doc("Warning")
  Warning,

  @doc("Output")
  Output,

  @doc("Error")
  Error,
}

@doc("AffinityType")
enum AffinityType {
  @doc("Affinity")
  Affinity,

  @doc("AntiAffinity")
  AntiAffinity,
}

@doc("The resource model definition representing SKU")
model Sku {
  @doc("The name of the SKU.")
  name: string;
}

@doc("Subscription trial availability")
model Trial {
  @doc("Trial status")
  @visibility("read")
  status?: TrialStatus;

  @doc("Number of trial hosts available")
  @visibility("read")
  availableHosts?: int32;
}

@doc("Subscription quotas")
model Quota {
  @doc("Remaining hosts quota by sku type")
  @visibility("read")
  hostsRemaining?: Record<int32>;

  @doc("Host quota is active for current subscription")
  @visibility("read")
  quotaEnabled?: QuotaEnabled;
}

@doc("A paged list of private clouds")
model PrivateCloudList is Azure.Core.Page<PrivateCloud>;

@doc("A private cloud resource")
model PrivateCloud is TrackedResource<PrivateCloudProperties> {
  @doc("Name of the private cloud")
  @pattern("^[-\\w\\._]+$")
  @key("privateCloudName")
  @path
  @segment("privateClouds")
  name: string;

  @doc("The private cloud SKU")
  sku: Sku;

  @doc("The identity of the private cloud, if configured.")
  identity?: PrivateCloudIdentity;
}

@doc("The properties of a private cloud resource")
model PrivateCloudProperties {
  ...PrivateCloudUpdateProperties;

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: PrivateCloudProvisioningState;

  @doc("An ExpressRoute Circuit")
  circuit?: Circuit;

  @doc("The endpoints")
  @visibility("read")
  endpoints?: Endpoints;

  @doc("""
The block of addresses should be unique across VNet in your subscription as
well as on-premise. Make sure the CIDR format is conformed to (A.B.C.D/X) where
A,B,C,D are between 0 and 255, and X is between 0 and 22
""")
  networkBlock: string;

  @doc("Network used to access vCenter Server and NSX-T Manager")
  @visibility("read")
  managementNetwork?: string;

  @doc("Used for virtual machine cold migration, cloning, and snapshot migration")
  @visibility("read")
  provisioningNetwork?: string;

  @doc("Used for live migration of virtual machines")
  @visibility("read")
  vmotionNetwork?: string;

  @doc("Optionally, set the vCenter admin password when the private cloud is created")
  vcenterPassword?: string;

  @doc("Optionally, set the NSX-T Manager password when the private cloud is created")
  nsxtPassword?: string;

  @doc("Thumbprint of the vCenter Server SSL certificate")
  @visibility("read")
  vcenterCertificateThumbprint?: string;

  @doc("Thumbprint of the NSX-T Manager SSL certificate")
  @visibility("read")
  nsxtCertificateThumbprint?: string;

  @doc("Array of cloud link IDs from other clouds that connect to this one")
  @visibility("read")
  externalCloudLinks?: string[];

  @doc("""
A secondary expressRoute circuit from a separate AZ. Only present in a
stretched private cloud
""")
  secondaryCircuit?: Circuit;

  @doc("""
Flag to indicate whether the private cloud has the quota for provisioned NSX
Public IP count raised from 64 to 1024
""")
  @visibility("read")
  nsxPublicIpQuotaRaised?: NsxPublicIpQuotaRaisedEnum;
}

@doc("An ExpressRoute Circuit")
model Circuit {
  @doc("CIDR of primary subnet")
  @visibility("read")
  primarySubnet?: string;

  @doc("CIDR of secondary subnet")
  @visibility("read")
  secondarySubnet?: string;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("Identifier of the ExpressRoute Circuit (Microsoft Colo only)")
  @visibility("read")
  expressRouteID?: string;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("ExpressRoute Circuit private peering identifier")
  @visibility("read")
  expressRoutePrivatePeeringID?: string;
}

@doc("Endpoint addresses")
model Endpoints {
  @doc("Endpoint for the NSX-T Data Center manager")
  @visibility("read")
  nsxtManager?: string;

  @doc("Endpoint for Virtual Center Server Appliance")
  @visibility("read")
  vcsa?: string;

  @doc("Endpoint for the HCX Cloud Manager")
  @visibility("read")
  hcxCloudManager?: string;
}

@doc("The properties of a private cloud resource that may be updated")
model PrivateCloudUpdateProperties {
  @doc("The default cluster used for management")
  managementCluster?: ManagementCluster;

  @doc("Connectivity to internet is enabled or disabled")
  internet?: InternetEnum;

  @doc("vCenter Single Sign On Identity Sources")
  identitySources?: IdentitySource[];

  @doc("Properties describing how the cloud is distributed across availability zones")
  availability?: AvailabilityProperties;

  @doc("Customer managed key encryption, can be enabled or disabled")
  encryption?: Encryption;

  @doc("""
Array of additional networks noncontiguous with networkBlock. Networks must be
unique and non-overlapping across VNet in your subscription, on-premise, and
this privateCloud networkBlock attribute. Make sure the CIDR format conforms to
(A.B.C.D/X).
""")
  extendedNetworkBlocks?: string[];
}

@doc("The properties of a management cluster")
model ManagementCluster {
  ...CommonClusterProperties;
}

@doc("The common properties of a cluster")
model CommonClusterProperties {
  @doc("The cluster size")
  clusterSize?: int32;

  @doc("The state of the cluster provisioning")
  @visibility("read")
  provisioningState?: ClusterProvisioningState;

  @doc("The identity")
  @visibility("read")
  clusterId?: int32;

  @doc("The hosts")
  hosts?: string[];
}

@doc("vCenter Single Sign On Identity Source")
model IdentitySource {
  @doc("The name of the identity source")
  name?: string;

  @doc("The domain's NetBIOS name")
  `alias`?: string;

  @doc("The domain's dns name")
  domain?: string;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("The base distinguished name for users")
  baseUserDN?: string;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
  @doc("The base distinguished name for groups")
  baseGroupDN?: string;

  @doc("Primary server URL")
  primaryServer?: string;

  @doc("Secondary server URL")
  secondaryServer?: string;

  @doc("Protect LDAP communication using SSL certificate (LDAPS)")
  ssl?: SslEnum;

  @doc("""
The ID of an Active Directory user with a minimum of read-only access to Base
DN for users and group
""")
  username?: string;

  @doc("""
The password of the Active Directory user with a minimum of read-only access to
Base DN for users and groups.
""")
  password?: string;
}

@doc("The properties describing private cloud availability zone distribution")
model AvailabilityProperties {
  @doc("The availability strategy for the private cloud")
  strategy?: AvailabilityStrategy;

  @doc("The primary availability zone for the private cloud")
  zone?: int32;

  @doc("The secondary availability zone for the private cloud")
  secondaryZone?: int32;
}

@doc("The properties of customer managed encryption key")
model Encryption {
  @doc("Status of customer managed encryption key")
  status?: EncryptionState;

  @doc("The key vault where the encryption key is stored")
  keyVaultProperties?: EncryptionKeyVaultProperties;
}

@doc("An Encryption Key")
model EncryptionKeyVaultProperties {
  @doc("The name of the key.")
  keyName?: string;

  @doc("The version of the key.")
  keyVersion?: string;

  @doc("The auto-detected version of the key if versionType is auto-detected.")
  @visibility("read")
  autoDetectedKeyVersion?: string;

  @doc("The URL of the vault.")
  keyVaultUrl?: string;

  @doc("The state of key provided")
  @visibility("read")
  keyState?: EncryptionKeyStatus;

  @doc("Property of the key if user provided or auto detected")
  @visibility("read")
  versionType?: EncryptionVersionType;
}

@doc("Identity for the virtual machine.")
model PrivateCloudIdentity {
  @doc("""
The principal ID of private cloud identity. This property will only be provided
for a system assigned identity.
""")
  @visibility("read")
  principalId?: string;

  @doc("""
The tenant ID associated with the private cloud. This property will only be
provided for a system assigned identity.
""")
  @visibility("read")
  tenantId?: string;

  @doc("""
The type of identity used for the private cloud. The type 'SystemAssigned'
refers to an implicitly created identity. The type 'None' will remove any
identities from the Private Cloud.
""")
  type?: ResourceIdentityType;
}

@doc("An update to a private cloud resource")
model PrivateCloudUpdate {
  @doc("Resource tags")
  tags?: Record<string>;

  @doc("The updatable properties of a private cloud resource")
  properties?: PrivateCloudUpdateProperties;

  @doc("The identity of the private cloud, if configured.")
  identity?: PrivateCloudIdentity;
}

@doc("A paged list of clusters")
model ClusterList is Azure.Core.Page<Cluster>;

@doc("A cluster resource")
model Cluster is ProxyResource<ClusterProperties> {
  @doc("Name of the cluster")
  @pattern("^[-\\w\\._]+$")
  @key("clusterName")
  @path
  @segment("clusters")
  name: string;

  @doc("The cluster SKU")
  sku: Sku;
}

@doc("The properties of a cluster")
model ClusterProperties {
  ...CommonClusterProperties;
}

@doc("An update of a cluster resource")
model ClusterUpdate {
  @doc("The properties of a cluster resource that may be updated")
  properties?: ClusterUpdateProperties;
}

@doc("The properties of a cluster that may be updated")
model ClusterUpdateProperties {
  @doc("The cluster size")
  clusterSize?: int32;

  @doc("The hosts")
  hosts?: string[];
}

@doc("List of all zones and associated hosts for a cluster")
model ClusterZoneList {
  @doc("Zone and associated hosts info")
  zones?: ClusterZone[];
}

@doc("Zone and associated hosts info")
model ClusterZone {
  @doc("List of hosts belonging to the availability zone in a cluster")
  @visibility("read")
  hosts?: string[];

  @doc("Availability zone identifier")
  @visibility("read")
  zone?: string;
}

@doc("A paged list of datastores")
model DatastoreList is Azure.Core.Page<Datastore>;

@doc("A datastore resource")
model Datastore is ProxyResource<DatastoreProperties> {
  @doc("Name of the datastore")
  @pattern("^[-\\w\\._]+$")
  @key("datastoreName")
  @path
  @segment("datastores")
  name: string;
}

@doc("The properties of a datastore")
model DatastoreProperties {
  @doc("The state of the datastore provisioning")
  @visibility("read")
  provisioningState?: DatastoreProvisioningState;

  @doc("An Azure NetApp Files volume")
  netAppVolume?: NetAppVolume;

  @doc("An iSCSI volume")
  diskPoolVolume?: DiskPoolVolume;

  @doc("The operational status of the datastore")
  @visibility("read")
  status?: DatastoreStatus;
}

@doc("An Azure NetApp Files volume from Microsoft.NetApp provider")
model NetAppVolume {
  @doc("Azure resource ID of the NetApp volume")
  id: string;
}

@doc("An iSCSI volume from Microsoft.StoragePool provider")
model DiskPoolVolume {
  @doc("Azure resource ID of the iSCSI target")
  targetId: string;

  @doc("Name of the LUN to be used for datastore")
  lunName: string;

  @doc("""
Mode that describes whether the LUN has to be mounted as a datastore or
attached as a LUN
""")
  mountOption?: MountOptionEnum;

  @doc("Device path")
  @visibility("read")
  path?: string;
}

@doc("Administrative credentials for accessing vCenter and NSX-T")
model AdminCredentials {
  @doc("NSX-T Manager username")
  @visibility("read")
  nsxtUsername?: string;

  @doc("NSX-T Manager password")
  @visibility("read")
  nsxtPassword?: string;

  @doc("vCenter admin username")
  @visibility("read")
  vcenterUsername?: string;

  @doc("vCenter admin password")
  @visibility("read")
  vcenterPassword?: string;
}

@doc("A paged list of HCX Enterprise Sites")
model HcxEnterpriseSiteList is Azure.Core.Page<HcxEnterpriseSite>;

@doc("An HCX Enterprise Site resource")
model HcxEnterpriseSite is ProxyResource<HcxEnterpriseSiteProperties> {
  @doc("Name of the HCX Enterprise Site")
  @pattern("^[-\\w\\._]+$")
  @key("hcxEnterpriseSiteName")
  @path
  @segment("hcxEnterpriseSites")
  name: string;
}

@doc("The properties of an HCX Enterprise Site")
model HcxEnterpriseSiteProperties {
  @doc("The activation key")
  @visibility("read")
  activationKey?: string;

  @doc("The status of the HCX Enterprise Site")
  @visibility("read")
  status?: HcxEnterpriseSiteStatus;
}

@doc("A paged list of ExpressRoute Circuit Authorizations")
model ExpressRouteAuthorizationList
  is Azure.Core.Page<ExpressRouteAuthorization>;

@doc("ExpressRoute Circuit Authorization")
model ExpressRouteAuthorization
  is ProxyResource<ExpressRouteAuthorizationProperties> {
  @doc("Name of the ExpressRoute Circuit Authorization")
  @pattern("^[-\\w\\._]+$")
  @key("authorizationName")
  @path
  @segment("authorizations")
  name: string;
}

@doc("The properties of an ExpressRoute Circuit Authorization resource")
model ExpressRouteAuthorizationProperties {
  @doc("The state of the  ExpressRoute Circuit Authorization provisioning")
  @visibility("read")
  provisioningState?: ExpressRouteAuthorizationProvisioningState;

  @doc("The ID of the ExpressRoute Circuit Authorization")
  @visibility("read")
  expressRouteAuthorizationId?: string;

  @doc("The key of the ExpressRoute Circuit Authorization")
  @visibility("read")
  expressRouteAuthorizationKey?: string;

  @doc("The ID of the ExpressRoute Circuit")
  expressRouteId?: string;
}

@doc("A paged list of global reach connections")
model GlobalReachConnectionList is Azure.Core.Page<GlobalReachConnection>;

@doc("A global reach connection resource")
model GlobalReachConnection is ProxyResource<GlobalReachConnectionProperties> {
  @doc("Name of the global reach connection")
  @pattern("^[-\\w\\._]+$")
  @key("globalReachConnectionName")
  @path
  @segment("globalReachConnections")
  name: string;
}

@doc("The properties of a global reach connection")
model GlobalReachConnectionProperties {
  @doc("The state of the  ExpressRoute Circuit Authorization provisioning")
  @visibility("read")
  provisioningState?: GlobalReachConnectionProvisioningState;

  @doc("""
The network used for global reach carved out from the original network block
provided for the private cloud
""")
  @visibility("read")
  addressPrefix?: string;

  @doc("""
Authorization key from the peer express route used for the global reach
connection
""")
  authorizationKey?: string;

  @doc("The connection status of the global reach connection")
  @visibility("read")
  circuitConnectionStatus?: GlobalReachConnectionStatus;

  @doc("""
Identifier of the ExpressRoute Circuit to peer with in the global reach
connection
""")
  peerExpressRouteCircuit?: string;

  @doc("""
The ID of the Private Cloud's ExpressRoute Circuit that is participating in the
global reach connection
""")
  expressRouteId?: string;
}

@doc("Workload Network")
model WorkloadNetwork is ProxyResource<WorkloadNetworkProperties> {
  @doc("Name of the global reach connection")
  @key("workloadNetworkName")
  @path
  @segment("workloadNetworks")
  name: WorkloadNetworkName;
}

@doc("The properties of a workload network")
model WorkloadNetworkProperties {}

@doc("A list of workload networks")
model WorkloadNetworkList is Azure.Core.Page<WorkloadNetwork>;

@doc("A list of NSX Segments")
model WorkloadNetworkSegmentsList is Azure.Core.Page<WorkloadNetworkSegment>;

@doc("NSX Segment")
model WorkloadNetworkSegment
  is ProxyResource<WorkloadNetworkSegmentProperties> {
  @doc("The ID of the NSX Segment")
  @pattern("^[-\\w\\._]+$")
  @key("segmentId")
  @path
  @segment("segments")
  name: string;
}

@doc("NSX Segment Properties")
model WorkloadNetworkSegmentProperties {
  @doc("Display name of the segment.")
  displayName?: string;

  @doc("Gateway which to connect segment to.")
  connectedGateway?: string;

  @doc("Subnet which to connect segment to.")
  subnet?: WorkloadNetworkSegmentSubnet;

  @doc("Port Vif which segment is associated with.")
  @visibility("read")
  portVif?: WorkloadNetworkSegmentPortVif[];

  @doc("Segment status.")
  @visibility("read")
  status?: SegmentStatusEnum;

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: WorkloadNetworkSegmentProvisioningState;

  @doc("NSX revision number.")
  revision?: int32;
}

@doc("Subnet configuration for segment")
model WorkloadNetworkSegmentSubnet {
  @doc("DHCP Range assigned for subnet.")
  dhcpRanges?: string[];

  @doc("Gateway address.")
  gatewayAddress?: string;
}

@doc("Ports and any VIF attached to segment.")
model WorkloadNetworkSegmentPortVif {
  @doc("Name of port or VIF attached to segment.")
  portName?: string;
}

@doc("A list of NSX dhcp entities")
model WorkloadNetworkDhcpList is Azure.Core.Page<WorkloadNetworkDhcp>;

@doc("NSX DHCP")
model WorkloadNetworkDhcp is ProxyResource<WorkloadNetworkDhcpEntity> {
  @doc("The ID of the DHCP configuration")
  @pattern("^[-\\w\\._]+$")
  @key("dhcpId")
  @path
  @segment("dhcpConfigurations")
  name: string;
}

@doc("""
Base class for WorkloadNetworkDhcpServer and WorkloadNetworkDhcpRelay to
inherit from
""")
@discriminator("dhcpType")
model WorkloadNetworkDhcpEntity {
  @doc("Display name of the DHCP entity.")
  displayName?: string;

  @doc("NSX Segments consuming DHCP.")
  @visibility("read")
  segments?: string[];

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: WorkloadNetworkDhcpProvisioningState;

  @doc("NSX revision number.")
  revision?: int32;
}

@doc("A list of NSX Gateways")
model WorkloadNetworkGatewayList is Azure.Core.Page<WorkloadNetworkGateway>;

@doc("NSX Gateway.")
model WorkloadNetworkGateway
  is ProxyResource<WorkloadNetworkGatewayProperties> {
  @doc("The ID of the NSX Gateway")
  @pattern("^[-\\w\\._]+$")
  @key("gatewayId")
  @path
  @segment("gateways")
  name: string;
}

@doc("Properties of a NSX Gateway.")
model WorkloadNetworkGatewayProperties {
  @doc("Display name of the DHCP entity.")
  displayName?: string;

  @doc("NSX Gateway Path.")
  @visibility("read")
  path?: string;
}

@doc("A list of NSX Port Mirroring")
model WorkloadNetworkPortMirroringList
  is Azure.Core.Page<WorkloadNetworkPortMirroring>;

@doc("NSX Port Mirroring")
model WorkloadNetworkPortMirroring
  is ProxyResource<WorkloadNetworkPortMirroringProperties> {
  @doc("ID of the NSX port mirroring profile.")
  @pattern("^[-\\w\\._]+$")
  @key("portMirroringId")
  @path
  @segment("portMirroringProfiles")
  name: string;
}

@doc("NSX Port Mirroring Properties")
model WorkloadNetworkPortMirroringProperties {
  @doc("Display name of the port mirroring profile.")
  displayName?: string;

  @doc("Direction of port mirroring profile.")
  direction?: PortMirroringDirectionEnum;

  @doc("Source VM Group.")
  source?: string;

  @doc("Destination VM Group.")
  destination?: string;

  @doc("Port Mirroring Status.")
  @visibility("read")
  status?: PortMirroringStatusEnum;

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: WorkloadNetworkPortMirroringProvisioningState;

  @doc("NSX revision number.")
  revision?: int32;
}

#suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
@doc("A list of NSX VM Groups")
model WorkloadNetworkVMGroupsList is Azure.Core.Page<WorkloadNetworkVMGroup>;

#suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
@doc("NSX VM Group")
model WorkloadNetworkVMGroup
  is ProxyResource<WorkloadNetworkVMGroupProperties> {
  @doc("ID of the VM group.")
  @pattern("^[-\\w\\._]+$")
  @key("vmGroupId")
  @path
  @segment("vmGroups")
  name: string;
}

#suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
@doc("NSX VM Group Properties")
model WorkloadNetworkVMGroupProperties {
  @doc("Display name of the VM group.")
  displayName?: string;

  @doc("Virtual machine members of this group.")
  members?: string[];

  @doc("VM Group status.")
  @visibility("read")
  status?: VMGroupStatusEnum;

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: WorkloadNetworkVMGroupProvisioningState;

  @doc("NSX revision number.")
  revision?: int32;
}

@doc("A list of NSX Virtual Machines")
model WorkloadNetworkVirtualMachinesList
  is Azure.Core.Page<WorkloadNetworkVirtualMachine>;

@doc("NSX Virtual Machine")
model WorkloadNetworkVirtualMachine
  is ProxyResource<WorkloadNetworkVirtualMachineProperties> {
  @doc("ID of the virtual machine.")
  @pattern("^[-\\w\\._]+$")
  @key("virtualMachineId")
  @path
  @segment("virtualMachines")
  name: string;
}

@doc("NSX Virtual Machine Properties")
model WorkloadNetworkVirtualMachineProperties {
  @doc("Display name of the VM.")
  displayName?: string;

  @doc("Virtual machine type.")
  @visibility("read")
  vmType?: VMTypeEnum;
}

@doc("A list of NSX DNS Services")
model WorkloadNetworkDnsServicesList
  is Azure.Core.Page<WorkloadNetworkDnsService>;

@doc("NSX DNS Service")
model WorkloadNetworkDnsService
  is ProxyResource<WorkloadNetworkDnsServiceProperties> {
  @doc("ID of the DNS service.")
  @pattern("^[-\\w\\._]+$")
  @key("dnsServiceId")
  @path
  @segment("dnsServices")
  name: string;
}

@doc("NSX DNS Service Properties")
model WorkloadNetworkDnsServiceProperties {
  @doc("Display name of the DNS Service.")
  displayName?: string;

  @doc("DNS service IP of the DNS Service.")
  dnsServiceIp?: string;

  @doc("Default DNS zone of the DNS Service.")
  defaultDnsZone?: string;

  @doc("FQDN zones of the DNS Service.")
  fqdnZones?: string[];

  @doc("DNS Service log level.")
  logLevel?: DnsServiceLogLevelEnum;

  @doc("DNS Service status.")
  @visibility("read")
  status?: DnsServiceStatusEnum;

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: WorkloadNetworkDnsServiceProvisioningState;

  @doc("NSX revision number.")
  revision?: int32;
}

@doc("A list of NSX DNS Zones")
model WorkloadNetworkDnsZonesList is Azure.Core.Page<WorkloadNetworkDnsZone>;

@doc("NSX DNS Zone")
model WorkloadNetworkDnsZone
  is ProxyResource<WorkloadNetworkDnsZoneProperties> {
  @doc("ID of the DNS zone.")
  @pattern("^[-\\w\\._]+$")
  @key("dnsZoneId")
  @path
  @segment("dnsZones")
  name: string;
}

@doc("NSX DNS Zone Properties")
model WorkloadNetworkDnsZoneProperties {
  @doc("Display name of the DNS Zone.")
  displayName?: string;

  @doc("Domain names of the DNS Zone.")
  domain?: string[];

  @doc("DNS Server IP array of the DNS Zone.")
  dnsServerIps?: string[];

  @doc("Source IP of the DNS Zone.")
  sourceIp?: string;

  @doc("Number of DNS Services using the DNS zone.")
  dnsServices?: int32;

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: WorkloadNetworkDnsZoneProvisioningState;

  @doc("NSX revision number.")
  revision?: int32;
}

#suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
@doc("A list of NSX Public IP Blocks")
model WorkloadNetworkPublicIPsList is Azure.Core.Page<WorkloadNetworkPublicIP>;

#suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
@doc("NSX Public IP Block")
model WorkloadNetworkPublicIP
  is ProxyResource<WorkloadNetworkPublicIPProperties> {
  @doc("ID of the DNS zone.")
  @pattern("^[-\\w\\._]+$")
  @key("publicIPId")
  @path
  @segment("publicIPs")
  name: string;
}

#suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
@doc("NSX Public IP Block Properties")
model WorkloadNetworkPublicIPProperties {
  @doc("Display name of the Public IP Block.")
  displayName?: string;

  @doc("Number of Public IPs requested.")
  numberOfPublicIPs?: int32;

  @doc("CIDR Block of the Public IP Block.")
  @visibility("read")
  publicIPBlock?: string;

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: WorkloadNetworkPublicIPProvisioningState;
}

@doc("A paged list of cloud links")
model CloudLinkList is Azure.Core.Page<CloudLink>;

@doc("A cloud link resource")
model CloudLink is ProxyResource<CloudLinkProperties> {
  @doc("Name of the cloud link.")
  @pattern("^[-\\w\\._]+$")
  @key("cloudLinkName")
  @path
  @segment("cloudLinks")
  name: string;
}

@doc("The properties of a cloud link.")
model CloudLinkProperties {
  @doc("The state of the cloud link.")
  @visibility("read")
  status?: CloudLinkStatus;

  @doc("Identifier of the other private cloud participating in the link.")
  linkedCloud?: string;
}

@doc("A paged list of addons")
model AddonList is Azure.Core.Page<Addon>;

@doc("An addon resource")
model Addon is ProxyResource<AddonProperties> {
  @doc("Name of the addon.")
  @pattern("^[-\\w\\._]+$")
  @key("addonName")
  @path
  @segment("addons")
  name: string;
}

@doc("The properties of an addon")
@discriminator("addonType")
model AddonProperties {
  @doc("The state of the addon provisioning")
  @visibility("read")
  provisioningState?: AddonProvisioningState;
}

@doc("A list of Virtual Machines")
model VirtualMachinesList is Azure.Core.Page<VirtualMachine>;

@doc("Virtual Machine")
model VirtualMachine is ProxyResource<VirtualMachineProperties> {
  @doc("ID of the virtual machine.")
  @pattern("^[-\\w\\._]+$")
  @key("virtualMachineId")
  @path
  @segment("virtualMachines")
  name: string;
}

@doc("Virtual Machine Properties")
model VirtualMachineProperties {
  @doc("Display name of the VM.")
  @visibility("read")
  displayName?: string;

  @doc("Virtual machine managed object reference id")
  @visibility("read")
  moRefId?: string;

  @doc("Path to virtual machine's folder starting from datacenter virtual machine folder")
  @visibility("read")
  folderPath?: string;

  @doc("Whether VM DRS-driven movement is restricted (enabled) or not (disabled)")
  @visibility("read")
  restrictMovement?: VirtualMachineRestrictMovementState;
}

@doc("Set VM DRS-driven movement to restricted (enabled) or not (disabled)")
model VirtualMachineRestrictMovement {
  @doc("Whether VM DRS-driven movement is restricted (enabled) or not (disabled)")
  restrictMovement?: VirtualMachineRestrictMovementState;
}

@doc("Represents list of placement policies")
model PlacementPoliciesList is Azure.Core.Page<PlacementPolicy>;

@doc("A vSphere Distributed Resource Scheduler (DRS) placement policy")
model PlacementPolicy is ProxyResource<PlacementPolicyProperties> {
  @doc("Name of the placement policy.")
  @pattern("^[-\\w\\._]+$")
  @key("placementPolicyName")
  @path
  @segment("placementPolicies")
  name: string;
}

@doc("Abstract placement policy properties")
@discriminator("type")
model PlacementPolicyProperties {
  @doc("Whether the placement policy is enabled or disabled")
  state?: PlacementPolicyState;

  @doc("Display name of the placement policy")
  displayName?: string;

  @doc("The provisioning state")
  @visibility("read")
  provisioningState?: PlacementPolicyProvisioningState;
}

@doc("An update of a DRS placement policy resource")
model PlacementPolicyUpdate {
  @doc("The properties of a placement policy resource that may be updated")
  properties?: PlacementPolicyUpdateProperties;
}

@doc("The properties of a placement policy resource that may be updated")
model PlacementPolicyUpdateProperties {
  @doc("Whether the placement policy is enabled or disabled")
  state?: PlacementPolicyState;

  @doc("Virtual machine members list")
  vmMembers?: string[];

  @doc("Host members list")
  hostMembers?: string[];

  @doc("vm-host placement policy affinity strength (should/must)")
  affinityStrength?: AffinityStrength;

  @doc("placement policy azure hybrid benefit opt-in type")
  azureHybridBenefitType?: AzureHybridBenefitType;
}

@doc("A list of the available script packages")
model ScriptPackagesList is Azure.Core.Page<ScriptPackage>;

@doc("Script Package resources available for execution")
model ScriptPackage is ProxyResource<ScriptPackageProperties> {
  @doc("Name of the script package.")
  @pattern("^[-\\w\\._@]+$")
  @key("scriptPackageName")
  @path
  @segment("scriptPackages")
  name: string;
}

@doc("Properties of a Script Package subresource")
model ScriptPackageProperties {
  @doc("User friendly description of the package")
  @visibility("read")
  description?: string;

  @doc("Module version")
  @visibility("read")
  version?: string;

  @doc("Company that created and supports the package")
  @visibility("read")
  company?: string;

  @doc("Link to support by the package vendor")
  @visibility("read")
  uri?: string;
}

@doc("Pageable list of scripts/cmdlets")
model ScriptCmdletsList is Azure.Core.Page<ScriptCmdlet>;

@doc("A cmdlet available for script execution")
model ScriptCmdlet is ProxyResource<ScriptCmdletProperties> {
  @doc("Name of the script cmdlet.")
  @pattern("^[-\\w\\._]+$")
  @key("scriptCmdletName")
  @path
  @segment("scriptCmdlets")
  name: string;
}

@doc("Properties of a pre-canned script")
model ScriptCmdletProperties {
  @doc("Description of the scripts functionality")
  @visibility("read")
  description?: string;

  @doc("Recommended time limit for execution")
  @visibility("read")
  timeout?: string;

  @doc("Parameters the script will accept")
  @visibility("read")
  parameters?: ScriptParameter[];
}

@doc("An parameter that the script will accept")
model ScriptParameter {
  @doc("""
The type of parameter the script is expecting. psCredential is a
PSCredentialObject
""")
  @visibility("read")
  type?: ScriptParameterTypes;

  @doc("The parameter name that the script will expect a parameter value for")
  name?: string;

  @doc("User friendly description of the parameter")
  @visibility("read")
  description?: string;

  @doc("""
Should this parameter be visible to arm and passed in the parameters argument
when executing
""")
  @visibility("read")
  visibility?: VisibilityParameterEnum;

  @doc("Is this parameter required or optional")
  @visibility("read")
  optional?: OptionalParamEnum;
}

@doc("Pageable list of script executions")
model ScriptExecutionsList is Azure.Core.Page<ScriptExecution>;

@doc("An instance of a script executed by a user - custom or AVS")
model ScriptExecution is ProxyResource<ScriptExecutionProperties> {
  @doc("Name of the script cmdlet.")
  @pattern("^[-\\w\\._]+$")
  @key("scriptExecutionName")
  @path
  @segment("scriptExecutions")
  name: string;
}

@doc("Properties of a user-invoked script")
model ScriptExecutionProperties {
  @doc("A reference to the script cmdlet resource if user is running a AVS script")
  scriptCmdletId?: string;

  @doc("Parameters the script will accept")
  parameters?: ScriptExecutionParameter[];

  @doc("""
Parameters that will be hidden/not visible to ARM, such as passwords and
credentials
""")
  hiddenParameters?: ScriptExecutionParameter[];

  @doc("""
Error message if the script was able to run, but if the script itself had
errors or powershell threw an exception
""")
  failureReason?: string;

  @doc("Time limit for execution")
  timeout: string;

  @doc("Time to live for the resource. If not provided, will be available for 60 days")
  retention?: string;

  @doc("Time the script execution was submitted")
  @visibility("read")
  submittedAt?: utcDateTime;

  @doc("Time the script execution was started")
  @visibility("read")
  startedAt?: utcDateTime;

  @doc("Time the script execution was finished")
  @visibility("read")
  finishedAt?: utcDateTime;

  @doc("The state of the script execution resource")
  @visibility("read")
  provisioningState?: ScriptExecutionProvisioningState;

  @doc("Standard output stream from the powershell execution")
  output?: string[];

  #suppress "@azure-tools/typespec-azure-core/bad-record-type" "It is unknown."
  @doc("User-defined dictionary.")
  namedOutputs?: Record<unknown>;

  @doc("Standard information out stream from the powershell execution")
  @visibility("read")
  information?: string[];

  @doc("Standard warning out stream from the powershell execution")
  @visibility("read")
  warnings?: string[];

  @doc("Standard error output stream from the powershell execution")
  @visibility("read")
  errors?: string[];
}

@doc("The arguments passed in to the execution")
@discriminator("type")
model ScriptExecutionParameter {
  @doc("The parameter name")
  name: string;
}

@doc("The properties of a Site Recovery Manager (SRM) addon")
model AddonSrmProperties extends AddonProperties {
  @doc("The Site Recovery Manager (SRM) license")
  licenseKey?: string;

  @doc("The type of private cloud addon")
  addonType: "SRM";
}

@doc("The properties of a vSphere Replication (VR) addon")
model AddonVrProperties extends AddonProperties {
  @doc("The vSphere Replication Server (VRS) count")
  vrsCount: int32;

  @doc("The type of private cloud addon")
  addonType: "VR";
}

@doc("The properties of an HCX addon")
model AddonHcxProperties extends AddonProperties {
  @doc("The HCX offer, example VMware MaaS Cloud Provider (Enterprise)")
  offer: string;

  @doc("The type of private cloud addon")
  addonType: "HCX";
}

@doc("The properties of an Arc addon")
model AddonArcProperties extends AddonProperties {
  @doc("The VMware vCenter resource ID")
  vCenter?: string;

  @doc("The type of private cloud addon")
  addonType: "Arc";
}

@doc("NSX DHCP Server")
model WorkloadNetworkDhcpServer extends WorkloadNetworkDhcpEntity {
  @doc("DHCP Server Address.")
  serverAddress?: string;

  @doc("DHCP Server Lease Time.")
  leaseTime?: int32;

  @doc("Type of DHCP: SERVER or RELAY.")
  dhcpType: "SERVER";
}

@doc("NSX DHCP Relay")
model WorkloadNetworkDhcpRelay extends WorkloadNetworkDhcpEntity {
  @doc("DHCP Relay Addresses. Max 3.")
  serverAddresses?: string[];

  @doc("Type of DHCP: SERVER or RELAY.")
  dhcpType: "RELAY";
}

@doc("VM-VM placement policy properties")
model VmVmPlacementPolicyProperties extends PlacementPolicyProperties {
  @doc("Virtual machine members list")
  vmMembers: string[];

  @doc("placement policy affinity type")
  affinityType: AffinityType;

  @doc("placement policy type")
  type: "VmVm";
}

@doc("VM-Host placement policy properties")
model VmHostPlacementPolicyProperties extends PlacementPolicyProperties {
  @doc("Virtual machine members list")
  vmMembers: string[];

  @doc("Host members list")
  hostMembers: string[];

  @doc("placement policy affinity type")
  affinityType: AffinityType;

  @doc("vm-host placement policy affinity strength (should/must)")
  affinityStrength?: AffinityStrength;

  @doc("placement policy azure hybrid benefit opt-in type")
  azureHybridBenefitType?: AzureHybridBenefitType;

  @doc("placement policy type")
  type: "VmHost";
}

@doc("a plain text value execution parameter")
model ScriptSecureStringExecutionParameter extends ScriptExecutionParameter {
  @doc("A secure value for the passed parameter, not to be stored in logs")
  secureValue?: string;

  @doc("The type of execution parameter")
  type: "SecureValue";
}

@doc("a plain text value execution parameter")
model ScriptStringExecutionParameter extends ScriptExecutionParameter {
  @doc("The value for the passed parameter")
  value?: string;

  @doc("The type of execution parameter")
  type: "Value";
}

#suppress "@azure-tools/typespec-azure-core/casing-style" "Can not change existing name."
@doc("a powershell credential object")
model PSCredentialExecutionParameter extends ScriptExecutionParameter {
  @doc("username for login")
  username?: string;

  @doc("password for login")
  password?: string;

  @doc("The type of execution parameter")
  type: "Credential";
}
