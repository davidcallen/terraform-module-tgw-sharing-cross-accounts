# ---------------------------------------------------------------------------------------------------------------------
# Create TGW Share and add Sharing to other accounts
#
#  Note: assumes that "Sharing within the AWS Organisation" is ENABLED.
#        https://docs.aws.amazon.com/ram/latest/userguide/getting-started-sharing.html#getting-started-sharing-orgs
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_ram_resource_share" "tgw" {
  name                      = "${var.resource_name_prefix}-tgw-share"
  allow_external_principals = false

  tags = merge(var.default_tags, {
    Name = "${var.resource_name_prefix}-tgw-share"
  })
}

resource "aws_ram_resource_association" "tgw" {
  # resource_arn       = data.aws_ec2_transit_gateway.tgw.arn
  resource_arn       = var.tgw_arn
  resource_share_arn = aws_ram_resource_share.tgw.arn
}

resource "aws_ram_principal_association" "tgw" {
  count              = length(var.share_with_account_ids)
  principal          = var.share_with_account_ids[count.index]
  resource_share_arn = aws_ram_resource_share.tgw.arn
}