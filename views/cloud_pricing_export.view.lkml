#NDT to persist pricing view back to BigQuery
view: pricing {
  view_label: "Pricing Taxonomy"
  derived_table: {
    datagroup_trigger: pricing_datagroup
    explore_source: cloud_pricing_export {
      column: sku__description {}
      column: service__description {}
      column: service__id {}
      column: sku__id {}
      column: pricing_usage_type {}
      column: pricing_unit_description {}
      column: pricing_unit {}
      column: pricing_type {}
      column: pricing_sub_type {}
      column: pricing_category {}
      # column: pricing_as_of_raw {}
      # column: list_price__aggregation_info__aggregation_level {}
      # column: list_price__aggregation_info__aggregation_interval {}
      # column: geo_taxonomy__type {}
      # column: currency_conversion_rate {}
      # column: category {}
      # column: business_entity_name {}
      # column: billing_account_price__price_info__discount_migrated_from {}
      # column: billing_account_price__price_info__discount_percent {}
      # column: billing_account_price__price_info__discount_percent_fixed_date {}
      # column: billing_account_price__price_info__discount_percent_fixed_month {}
      # column: billing_account_price__price_info__discount_percent_fixed_quarter {}
      # column: billing_account_price__price_info__discount_percent_fixed_week {}
      # column: billing_account_price__price_info__discount_percent_fixed_year {}
      # column: billing_account_price__price_info__price_reason {}
      # column: billing_account_price__aggregation_info__aggregation_interval {}
      # column: billing_account_price__aggregation_info__aggregation_level {}
      # column: billing_account_id {}
      # column: account_currency_code {}
      # column: _partitiondate_date {}
    }
  }
  dimension: sku__description {
    hidden: yes
    group_label: "SKU"
    description: "A description of the resource the price is associated with."
  }
  dimension: service__description {
    hidden: yes
    group_label: "Service"
    description: "The Google Cloud Platform service that offers the SKU."
  }
  dimension: service__id {
    hidden: yes
    group_label: "Servuce"
    description: "The ID of the Google Cloud Platform service that offers the SKU."
  }
  dimension: sku__id {
    hidden: yes
    primary_key: yes
    group_label: "SKU"
    description: "The ID of the resource the price is associated with."
  }
  dimension: pricing_usage_type {
    label: "Usage Type"
    # group_label: "Derived Taxonomy"
    description: "Usage type information is extracted from taxonomy information"
  }
  dimension: pricing_unit_description {
    # group_label: "Pricing Unit"
    description: "Human readable description of the pricing unit."
  }
  dimension: pricing_unit {
    # group_label: "Pricing Unit"
    description: "The unit in which resource usage is measured."
  }
  dimension: pricing_type {
    label: "Resource Type"
    # group_label: "Derived Taxonomy"
    description: "Pricing type information is extracted from taxonomy information"
  }
  dimension: pricing_sub_type {
    label: "Resource Sub Type"
    # group_label: "Derived Taxonomy"
    description: "Usage subtype information is extracted from taxonomy information"
  }
  dimension: pricing_category {
    label: "Resource Category"
    # group_label: "Derived Taxonomy"
    description: "Usage category information is extracted from taxonomy information"
  }
  # dimension_group: pricing_as_of_time {
  #   description: "When the pricing was generated. The pricing was valid as of this date,
  #   but could have been in effect before that."
  #   type: time
  # }
  # dimension: list_price__aggregation_info__aggregation_level {
  #   group_label: "List Price"
  #   label: "Aggregation Level"
  #   description: "Aggregation level for tiers."
  # }
  # dimension: list_price__aggregation_info__aggregation_interval {
  #   group_label: "List Price"
  #   label: "Aggregation Interval"
  #   description: "Aggregation interval for tiers."
  # }
  # dimension: geo_taxonomy__type {
  #   description: "The type of geographic metadata associated with the SKU."
  # }
  # dimension_group: export_time {
  #   description: "When the row was generated."
  #   type: time
  # }
  # dimension: currency_conversion_rate {
  #   description: "The exchange rate from US dollars to the local currency. That is,
  #   price/currency_conversion_rate is the price in US dollars."
  #   type: number
  # }
  # dimension: business_entity_name {
  #   description: "Business entity name of the service which offers the SKU."
  # }
  # dimension: billing_account_price__price_info__discount_migrated_from {
  #   label: "Discount Migrated From "
  #   group_label: "Billing Account Price"
  #   description: "For discounts that were migrated from other SKUs, the source SKU of the discount."
  # }
  # dimension: billing_account_price__price_info__discount_percent {
  #   group_label: "Billing Account Price"
  #   description: "For pricing that is the result of a percent discount, this is the percent discount used."
  #   type: number
  #   label: "Discount Percent"
  # }
  # dimension: billing_account_price__price_info__discount_percent_fixed_date {
  #   group_label: "Billing Account Price"
  #   description: "For pricing that is anchored to a specific date, the date used."
  #   type: date
  #   label: "Discount Percent Fixed Date"
  # }
  # dimension: billing_account_price__price_info__price_reason {
  #   group_label: "Billing Account Price"
  #   description: "Background information on where the price originated from."
  #   label: "Price Reason"
  # }
  # dimension: billing_account_price__aggregation_info__aggregation_interval {
  #   group_label: "Billing Account Price"
  #   description: "Aggregation interval for tiers."
  #   label: "Aggregation Interval"
  # }
  # dimension: billing_account_price__aggregation_info__aggregation_level {
  #   group_label: "Billing Account Price"
  #   description: "Aggregation level for tiers."
  #   label: "Aggregation Level"
  # }
  # dimension: billing_account_id {
  #   description: "The ID of the Cloud Billing Account that the pricing is associated with."
  # }
  # dimension: account_currency_code {
  #   description: "The currency that the billing account is configured to invoice in, using a 3-letter
  #   currency code defined in ISO 4217."
  # }
  # dimension: _partitiondate_date {
  #   hidden: yes
  #   type: date
  # }

}


view: cloud_pricing_export {
  sql_table_name: @{PRICING_TABLE} ;;

  dimension_group: _partitiondate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: account_currency_code {
    type: string
    description: "The currency that the billing account is configured to invoice in, using a 3-letter
    currency code defined in ISO 4217."
    sql: ${TABLE}.account_currency_code ;;
  }

  dimension: billing_account_id {
    type: string
    description: "The ID of the Cloud Billing Account that the pricing is associated with."
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: billing_account_price__aggregation_info__aggregation_interval {
    type: string
    description: "Aggregation interval for tiers."
    sql: ${TABLE}.billing_account_price.aggregation_info.aggregation_interval ;;
    group_label: "Billing Account Price Aggregation Info"
    group_item_label: "Aggregation Interval"
  }

  dimension: billing_account_price__aggregation_info__aggregation_level {
    type: string
    description: "Aggregation level for tiers."
    sql: ${TABLE}.billing_account_price.aggregation_info.aggregation_level ;;
    group_label: "Billing Account Price Aggregation Info"
    group_item_label: "Aggregation Level"
  }

  dimension: billing_account_price__price_info__discount_migrated_from {
    type: string
    description: "For discounts that were migrated from other SKUs, the source SKU of the discount."
    sql: ${TABLE}.billing_account_price.price_info.discount_migrated_from ;;
    group_label: "Billing Account Price Price Info"
    group_item_label: "Discount Migrated From"
  }

  dimension: billing_account_price__price_info__discount_percent {
    type: number
    description: "For pricing that is the result of a percent discount, this is the percent discount used."
    sql: ${TABLE}.billing_account_price.price_info.discount_percent ;;
    group_label: "Billing Account Price Price Info"
    group_item_label: "Discount Percent"
  }

  dimension_group: billing_account_price__price_info__discount_percent_fixed {
    type: time
    description: "For pricing that is anchored to a specific date, the date used."
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.billing_account_price.price_info.discount_percent_fixed_date ;;
    group_label: "Billing Account Price Price Info"
    group_item_label: "Discount Percent Fixed"
  }

  dimension: billing_account_price__price_info__price_reason {
    type: string
    description: "Background information on where the price originated from."
    sql: ${TABLE}.billing_account_price.price_info.price_reason ;;
    group_label: "Billing Account Price Price Info"
    group_item_label: "Price Reason"
  }

  dimension: billing_account_price__tiered_rates {
    hidden: yes
    sql: ${TABLE}.billing_account_price.tiered_rates ;;
    group_label: "Billing Account Price"
    group_item_label: "Tiered Rates"
  }

  dimension: business_entity_name {
    type: string
    description: "Business entity name of the service which offers the SKU."
    sql: ${TABLE}.business_entity_name ;;
  }

  dimension: currency_conversion_rate {
    type: number
    description: "The exchange rate from US dollars to the local currency. That is,
    price/currency_conversion_rate is the price in US dollars."
    sql: ${TABLE}.currency_conversion_rate ;;
  }

  dimension_group: export {
    type: time
    description: "When the row was generated."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.export_time ;;
  }

  dimension: geo_taxonomy__regions {
    hidden: yes
    sql: ${TABLE}.geo_taxonomy.regions ;;
    group_label: "Geo Taxonomy"
    group_item_label: "Regions"
  }

  dimension: geo_taxonomy__type {
    type: string
    description: "The type of geographic metadata associated with the SKU."
    sql: ${TABLE}.geo_taxonomy.type ;;
    group_label: "Geo Taxonomy"
    group_item_label: "Type"
  }

  dimension: list_price__aggregation_info__aggregation_interval {
    type: string
    description: "Aggregation interval for tiers."
    sql: ${TABLE}.list_price.aggregation_info.aggregation_interval ;;
    group_label: "List Price Aggregation Info"
    group_item_label: "Aggregation Interval"
  }

  dimension: list_price__aggregation_info__aggregation_level {
    type: string
    description: "Aggregation level for tiers."
    sql: ${TABLE}.list_price.aggregation_info.aggregation_level ;;
    group_label: "List Price Aggregation Info"
    group_item_label: "Aggregation Level"
  }

  dimension: list_price__tiered_rates {
    hidden: yes
    sql: ${TABLE}.list_price.tiered_rates ;;
    group_label: "List Price"
    group_item_label: "Tiered Rates"
  }

  dimension_group: pricing_as_of {
    type: time
    description: "When the pricing was generated. The pricing was valid as of this date,
    but could have been in effect before that."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pricing_as_of_time ;;
  }

  dimension: pricing_unit {
    type: string
    description: "The unit in which resource usage is measured."
    sql: ${TABLE}.pricing_unit ;;
  }

  dimension: pricing_unit_description {
    type: string
    description: "Human readable description of the pricing unit."
    sql: ${TABLE}.pricing_unit_description ;;
  }

  dimension: product_taxonomy {
    hidden: yes
    sql: ${TABLE}.product_taxonomy ;;
  }

  dimension: category {
    type: string
    sql:  ${product_taxonomy}[SAFE_OFFSET(1)] ;;
  }

  dimension: pricing_product_taxonomy_str {
    label: "Pricing Product Taxonomy"
    description: "A string representation of the product taxonomy"
    type: string
    sql: LOWER(ARRAY_TO_STRING(${product_taxonomy}, '->') ) ;;
  }

  dimension: pricing_geo_taxonomy_str {
    label: "Pricing Geo Taxonomy"
    description: "A string representation of the geo taxonomy"
    type: string
    sql: LOWER(ARRAY_TO_STRING(${geo_taxonomy__regions}, '->'));;
  }

  dimension: pricing_usage_type {
    description: "Usage type information is extracted from taxonomy information"
    sql: CASE
    -- Compute Engine
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, 'offline') THEN 'Commitment'
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, 'gce->vms commit') THEN 'Commitment'
    -- Compute Engine GPUS
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, 'gpus->gpus commit') THEN 'Commitment'
    -- Compute Engine Storage
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, 'commit') THEN 'Commitment'
    ELSE 'Usage'
    END ;;
  }

  dimension: pricing_sub_type {
    sql: CASE
    -- Compute Engine Cores
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)cores:') and REGEXP_CONTAINS(${sku__description}, r'^commit.*cpu') THEN
      IFNULL(REGEXP_EXTRACT(${sku__description}, r'commit.*: (.*) cpu .*'), 'Standard')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)cores:') and REGEXP_CONTAINS(${sku__description}, r'^commit.*core') THEN
      IFNULL(REGEXP_EXTRACT(${sku__description}, r'commit.*: (.*) core .*'), 'Standard')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)cores:') and REGEXP_CONTAINS(${sku__description}, r'^preemptible .* instance') THEN
      REGEXP_EXTRACT(${sku__description}, r'^preemptible(.*) instance .*')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)cores:') and REGEXP_CONTAINS(${sku__description}, r'^preemptible .* core') THEN
      REGEXP_EXTRACT(${sku__description}, r'^preemptible(.*) core .*')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)cores:') and REGEXP_CONTAINS(${sku__description}, r'premium') THEN
      REGEXP_EXTRACT(${sku__description}, r'(.*) premium .*')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)cores:') and REGEXP_CONTAINS(${sku__description}, r'instance') THEN
      REGEXP_EXTRACT(${sku__description}, r'(.*) instance .*')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)cores:') and REGEXP_CONTAINS(${sku__description}, r'core') THEN
      REGEXP_EXTRACT(${sku__description}, r'(.*) core .*')
    -- Compute Engine RAM
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)memory:') and REGEXP_CONTAINS(${sku__description}, r'^commit') THEN
      IFNULL(REGEXP_EXTRACT(${sku__description}, r'commit.*: (.*) ram .*'), 'Standard')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)memory:') and REGEXP_CONTAINS(${sku__description}, r'^preemptible .* instance') THEN
      REGEXP_EXTRACT(${sku__description}, r'^preemptible(.*) instance .*')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)memory:') and REGEXP_CONTAINS(${sku__description}, r'^preemptible .* ram') THEN
      REGEXP_EXTRACT(${sku__description}, r'^preemptible(.*) ram .*')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)memory:') and REGEXP_CONTAINS(${sku__description}, r'premium') THEN
      REGEXP_EXTRACT(${sku__description}, r'(.*) premium .*')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)memory:') and REGEXP_CONTAINS(${sku__description}, r'instance') THEN
      REGEXP_EXTRACT(${sku__description}, r'(.*) instance .*')
    WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms(.*)memory:') and REGEXP_CONTAINS(${sku__description}, r'ram') THEN
      REGEXP_EXTRACT(${sku__description}, r'(.*) ram .*')
    -- Cloud Storage
    WHEN ${service__description} = 'Cloud Storage' THEN ''
    -- BQ
    WHEN ${service__description} LIKE 'BigQuery%' THEN ''
    -- catch all
    ELSE ''
    END;;
  }

  dimension: pricing_type {
    sql: CASE
    -- Compute Engine
    WHEN ${service__description} = 'Compute Engine'
      THEN(
        CASE
          -- Cores
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'vms on demand->cores')
            THEN 'Cores On-demand'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'vms preemptible->cores')
            THEN 'Cores Preemptible'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cores') THEN 'Cores'
          -- RAM
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'vms on demand->memory')
            THEN 'RAM On-demand'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'vms preemptible->memory')
            THEN 'RAM Preemptible'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'memory') THEN 'RAM'
          -- PD/SSD
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'local ssd->on demand')
            THEN 'SSD Local On-demand'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'local ssd') THEN 'SSD Local'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'disk->ssd->capacity')
            THEN 'SSD Capacity'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'disk->standard->capacity')
            THEN 'Capacity'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'disk->standard->snapshot')
            THEN 'Snapshot'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'vm image storage')
            THEN 'Image Storage'
          -- Compute Engine Storage Requests
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'persistent disk->diskops')
            THEN 'IO Requests'
          -- Compute Engine Licenses
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'premium image') THEN 'Licensing fee'
          -- Compute Engine GPU
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gpus on demand')
            THEN 'GPUs On-demand'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gpus preemptible')
            THEN 'GPUs Preemptible'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gpus') THEN 'GPUs'
          -- Compute Network
          -- Ingress
          WHEN
              REGEXP_CONTAINS(
                ${pricing_product_taxonomy_str}, r'gce->ingress->premium|ingress->gce->premium'
              )
            THEN 'Ingress Premium'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->ingress->standard')
            THEN 'Ingress Standard'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->ingress->inter-zone')
            THEN 'Ingress Inter-zone'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->ingress->intra-zone')
            THEN 'Ingress Intra-zone'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->ingress->inter-region')
            THEN 'Ingress Inter-region'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->ingress->standard')
            THEN 'Ingress'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->ingress') THEN 'Ingress'
          -- Egress
          WHEN
              REGEXP_CONTAINS(
                ${pricing_product_taxonomy_str}, r'gce->egress->premium|egress->gce->premium'
              )
            THEN 'Egress Premium'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->egress->standard')
            THEN 'Egress Standard'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->egress->inter-zone')
            THEN 'Egress Inter-zone'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->egress->intra-zone')
            THEN 'Egress Intra-zone'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->egress->inter-region')
            THEN 'Egress Inter-region'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->egress') THEN 'Ingress'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'network->egress->gce') THEN 'Egress'
          -- Other
          WHEN
              REGEXP_CONTAINS(
                ${pricing_product_taxonomy_str}, r'cloud vpn->vpninter(region|net)ingress'
              )
            THEN 'Ingress VPN Inter-region/Internet'
          WHEN
              REGEXP_CONTAINS(
                ${pricing_product_taxonomy_str}, r'cloud vpn->vpninter(region|net)egress'
              )
            THEN 'Egress VPN Inter-region/Internet'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'interconnect->ingress')
            THEN 'Ingress Interconnect'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'interconnect->egress')
            THEN 'Egress Interconnect'
          WHEN
              REGEXP_CONTAINS(
                ${pricing_product_taxonomy_str}, r'interconnect->peeringorinterconnectegress'
              )
            THEN 'Egress Peering/Interconnect'
          -- LB
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cloud lb->lb traffic') THEN 'LB'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cloud lb->forwarding rule')
            THEN 'LB Forwarding rule'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cloud lb->internal')
            THEN 'LB Internal'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cloud lb->other') THEN 'LB Other'
          -- CDN
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cloud cdn->cache fill')
            THEN 'CDN Cache fill'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cloud cdn->other') THEN 'CDN Other'
          -- Cloud armor
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cloud armor->') THEN 'Cloud Armor'
          -- VPN
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cloud vpn->vpntunnel')
            THEN 'VPN tunnel'
          -- External IP
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, '->ip address') THEN 'IP Address'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, 'vpn->ip address')
            THEN 'IP Address VPN'
          -- Interconnect
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, '->interconnect')
            THEN 'Interconnect Partner/Dedicated'
          -- NAT Gateway
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, '->nat gateway') THEN 'NAT Gateway'
          -- FLow logs
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, '->vpc flow logs') THEN 'VPC flow logs'
          -- Compute Engine Dataflow
          -- Licensing
          WHEN
              REGEXP_CONTAINS(
                ${pricing_product_taxonomy_str}, 'licenses->dataflow streaming|licenses->dataproc'
              )
            THEN 'Licensing fee'
          ELSE '_PARSE_ERROR'
          END
      )
    -- Cloud Storage
    WHEN ${service__description} = 'Cloud Storage'
      THEN(
        CASE
          -- Cloud Storage Network
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'cdn->cache fill')
            THEN 'CDN Cache fill'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'egress->gae->premium')
            THEN 'Egress GAE/Firebase Premium'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'egress->gcs->(inter-region|premium)')
            THEN 'Egress Inter-Region/Premium'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'interconnect->egress')
            THEN 'Egress Peered/Interconnect'
          -- Cloud Storage Operations|Early Deletes|Storage
          -- DRA
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'dra->regional and dual-regional')
            THEN 'DRA Regional/Dual-Regional'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'dra') THEN 'DRA'
          -- Standard
          WHEN
              REGEXP_CONTAINS(
                ${pricing_product_taxonomy_str}, r'standard->multi-regional and dual-regional'
              )
            THEN 'Standard Mutli-Regional/Dual-Regional'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'standard->multi-regional')
            THEN 'Standard Mutli-Regional'
          WHEN
              REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'standard->regional and dual-regional')
            THEN 'Standard Regional/Dual-Regional'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'standard->regional')
            THEN 'Standard Regional/Dual-Regional'
          -- Archive
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'archive->regional and dual-regional')
            THEN 'Archive Regional/Dual-Regional'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'archive->multi-regional')
            THEN 'Archive Mutli-Regional'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'archive') THEN 'Archive'
          -- Coldline
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'coldline->multi-regional')
            THEN 'Coldline Multi-Regional'
          WHEN
              REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'coldline->regional and dual-regional')
            THEN 'Coldline Regional/Dual-Regional'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'coldline') THEN 'Coldline'
          -- Nearline
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'storage->nearline->multi-regional')
            THEN 'Nearline Multi-Regional'
          WHEN
              REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'nearline->regional and dual-regional')
            THEN 'Nearline Regional/Dual-Regional'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'nearline') THEN 'Nearline'
          -- fallback
          ELSE '_PARSE_ERROR'
          END
      )
    -- BigQuery
    WHEN ${service__description} = 'BigQuery'
      THEN(
        CASE
          -- BigQuery Analysis
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gbq->analysis->on demand')
            THEN 'Analysis On-demand'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gbq->analysis') THEN 'Analysis'
          -- BigQuery Streaming
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gbq->streaming')
            THEN 'Streaming Inserts'
          -- BigQuery Storage
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gbq->storage->active')
            THEN 'Storage Active'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gbq->storage->long term')
            THEN 'Storage Long-term'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gbq->storage') THEN 'Storage'
          -- catch all
          ELSE '_PARSE_ERROR'
          END
      )
      WHEN ${service__description} = 'BigQuery Reservation API'
        THEN(
          CASE
            -- BQ Reservation API
            WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'reservation api->flat rate flex') THEN 'Flat rate flex'
            WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'reservation api->flat rate') THEN 'Flat rate'
            -- catch all
            ELSE '_PARSE_ERROR'
          END
        )
      WHEN ${service__description} = 'BigQuery Storage API'
        THEN(
          CASE
            -- BQ Storage API
            WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gbq->streaming') AND ${sku__description} LIKE '%api - read' THEN 'Streaming Read'
            ELSE '_PARSE_ERROR'
          END
        )
    -- catch all for unsupported services
    ELSE '_PARSE_ERROR'
    END ;;
  }

  dimension: pricing_category {
    sql: CASE
    -- Compute Engine
    WHEN ${service__description} = 'Compute Engine' and ${category} = 'Compute'
      THEN(
        CASE
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'ingress|egress|network other')
            THEN 'Network'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'premium image') THEN 'Premium Image'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gce->vms|vm image storage') THEN 'VM'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gpus->gpus') THEN 'GPU'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'persistent disk|local ssd')
            THEN 'Persistent Disk'
          -- fallback
          ELSE ${category}
          END
      )
    -- Compute Engine Network
    WHEN ${service__description} = 'Compute Engine' and ${category} = 'Network' THEN 'Network'
    -- Compute Engine Marketplace Services
    WHEN ${service__description} = 'Compute Engine' and ${category} = 'Marketplace Services'
      THEN 'Marketplace Services'
    -- Compute Engine Analytics|Dataproc
    WHEN ${service__description} = 'Compute Engine' and ${category} = 'Analytics'
      THEN(
        CASE
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'analytics->(cloud dataflow)')
            THEN 'Cloud Dataflow'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'analytics->cloud dataproc')
            THEN 'Cloud Dataproc'
          -- fallback
          ELSE ${category}
          END
      )
    -- Cloud storage Network - NOTE: Nothing to recategorize
    WHEN ${service__description} = 'Cloud Storage' and ${category} = 'Network' THEN 'Network'
    WHEN ${service__description} = 'Cloud Storage' and ${category} = 'Storage'
      THEN(
        CASE
          -- Cloud Storage Retrieval
          WHEN REGEXP_CONTAINS(${sku__description}, r'data retrieval') THEN 'Data Retrieval'
          -- Cloud Storage Operations
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'gcs->ops') THEN 'Operations'
          WHEN REGEXP_CONTAINS(${pricing_product_taxonomy_str}, r'early delete') THEN 'Early Deletes'
          -- fallback
          ELSE 'Data Storage'
          END
      )
    -- Bigquery
    WHEN
        ${service__description} IN (
          'BigQuery', 'BigQuery Reservation API', 'BigQuery Storage API'
        )
      THEN ${category}
    -- Catch all other cases
    ELSE '_PARSE_ERROR'
    END ;;
  }

  dimension: service__description {
    type: string
    description: "The Google Cloud Platform service that offers the SKU."
    sql: ${TABLE}.service.description;;
    group_label: "Service"
    group_item_label: "Description"
  }

  dimension: service__id {
    type: string
    description: "The ID of the Google Cloud Platform service that offers the SKU."
    sql: ${TABLE}.service.id ;;
    group_label: "Service"
    group_item_label: "ID"
  }

  dimension: sku__description {
    type: string
    description: "A description of the resource the price is associated with."
    sql: LOWER(${TABLE}.sku.description);;
    group_label: "SKU"
    group_item_label: "Description"
  }

  dimension: sku__destination_migration_mappings {
    hidden: yes
    sql: ${TABLE}.sku.destination_migration_mappings ;;
    group_label: "SKU"
    group_item_label: "Destination Migration Mappings"
  }

  dimension: sku__id {
    type: string
    description: "The ID of the resource the price is associated with."
    sql: ${TABLE}.sku.id ;;
    group_label: "SKU"
    group_item_label: "ID"
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [business_entity_name]
  }
}

view: cloud_pricing_export__product_taxonomy {
  dimension: cloud_pricing_export__product_taxonomy {
    type: string
    description: "List of product categories that apply to the SKU."
    sql: cloud_pricing_export__product_taxonomy ;;
  }
}

view: cloud_pricing_export__geo_taxonomy__regions {
  dimension: cloud_pricing_export__geo_taxonomy__regions {
    type: string
    description: "The GCP regions associated with the SKU."
    sql: cloud_pricing_export__geo_taxonomy__regions ;;
  }
}

view: cloud_pricing_export__list_price__tiered_rates {
  dimension: account_currency_amount {
    type: number
    description: "The converted price, for the SKU, in the currency the Cloud Billing Account is
    configured to use. The conversion rate will be the one that is or was effective
    on the `pricing_as_of_time`."
    sql: ${TABLE}.account_currency_amount ;;
  }

  dimension: pricing_unit_quantity {
    type: number
    description: "Quantity of units the price refers to."
    sql: ${TABLE}.pricing_unit_quantity ;;
  }

  dimension: start_usage_amount {
    type: number
    description: "Lower bound amount for a given pricing tier, in pricing units."
    sql: ${TABLE}.start_usage_amount ;;
  }

  dimension: usd_amount {
    type: number
    description: "The price, in USD, for the SKU."
    sql: ${TABLE}.usd_amount ;;
  }
}

view: cloud_pricing_export__sku__destination_migration_mappings {
  dimension: cloud_pricing_export__sku__destination_migration_mappings {
    type: string
    description: "The destination SKU(s) names which this SKU is being migrated to."
    sql: cloud_pricing_export__sku__destination_migration_mappings ;;
  }
}

view: cloud_pricing_export__billing_account_price__tiered_rates {
  dimension: account_currency_amount {
    type: number
    description: "The converted price, for the SKU, in the currency the Cloud Billing Account is
    configured to use. The conversion rate will be the one that is or was effective
    on the `pricing_as_of_time`."
    sql: ${TABLE}.account_currency_amount ;;
  }

  dimension: pricing_unit_quantity {
    type: number
    description: "Quantity of units the price refers to."
    sql: ${TABLE}.pricing_unit_quantity ;;
  }

  dimension: start_usage_amount {
    type: number
    description: "Lower bound amount for a given pricing tier, in pricing units."
    sql: ${TABLE}.start_usage_amount ;;
  }

  dimension: usd_amount {
    type: number
    description: "The price, in USD, for the SKU."
    sql: ${TABLE}.usd_amount ;;
  }
}
