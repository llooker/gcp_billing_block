################ Constants ################

constant: RECOMMENDATION_TABLE {
  value: "`anilgcp-co-dev.recommender.recommendations_export_v2`"
  export: override_optional
}

constant: BILLING_TABLE {
  value: "`anilgcp-co-dev.billing.gcp_billing_export_public`"
  export: override_optional
}

constant: PRICING_TABLE {
  value: "`anilgcp-co-dev.billing.cloud_pricing_export`"
  export: override_optional
}

constant: CONNECTION {
  value: "leigha-bq-dev"
  export: override_optional
}
