defmodule AmazonProductAdvertisingClientTest do
  use ExUnit.Case, async: true

  @doc """
  Taken from the Example REST Requests page of the Product Advertising API documentation:
  http://docs.aws.amazon.com/AWSECommerceService/latest/DG/rest-signature.html
  """
  test "the request is properly signed" do
    Application.put_env(:amazon_product_advertising_client, :aws_secret_access_key, "1234567890")

    unsigned = "http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&Operation=ItemLookup&ItemId=0679722769&ResponseGroup=ItemAttributes,Offers,Images,Reviews&Version=2009-01-06&Timestamp=2009-01-01T12:00:00Z" 
    signed = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&ItemId=0679722769&Operation=ItemLookup&ResponseGroup=ItemAttributes%2COffers%2CImages%2CReviews&Service=AWSECommerceService&Timestamp=2009-01-01T12%3A00%3A00Z&Version=2009-01-06&Signature=M%2Fy0%2BEAFFGaUAp4bWv%2FWEuXYah99pVsxvqtAuC8YN7I%3D"
    assert signed == AmazonProductAdvertisingClient.process_url unsigned
  end
end
