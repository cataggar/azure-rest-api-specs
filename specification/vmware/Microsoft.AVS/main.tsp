import "@typespec/versioning";
import "@azure-tools/typespec-azure-resource-manager";
import "./routes.tsp";

using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.Versioning;

@armProviderNamespace("Microsoft.AVS")
@service({
  title: "Azure VMware Solution API",
})

@doc("Azure VMware Solution API")
@versioned(Versions)
namespace Microsoft.AVS;

// interface Operations extends Azure.ResourceManager.Operations {}

@doc("Azure VMware Solution API versions.")
enum Versions {
  @doc("Azure VMware Solution API version 2023-03-01.")
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  v2023_03_01: "2023-03-01",
}