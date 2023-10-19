using TypeSpec.Http;
using Azure.ResourceManager;

namespace Microsoft.AVS;

@doc("The parameter for the private cloud name.")
model PrivateCloudParameter {
  @path
  @doc("Name of the private cloud")
  // @pattern("^[-\\w\\._]+$");
  privateCloudName: string;
}
