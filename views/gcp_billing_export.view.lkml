view: gcp_billing_export {
  view_label: "Billing"
  derived_table: {
    partition_keys: ["usage_start_time"]
    # cluster_keys: ["project.id"]
    datagroup_trigger: billing_datagroup
    increment_key: "export_date"
    increment_offset: 0
    sql: select *, generate_uuid() as pk from @{BILLING_TABLE}
    WHERE {% incrementcondition %} export_time {% endincrementcondition %};;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.pk ;;
  }

  dimension_group: _partitiondate {
    hidden: yes
    type: time
    group_label: "Partition Fields"
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
    description: "Partition column for the table - filter here to leverage partitions"
    group_label: "Partition Fields"
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


  dimension: adjustment_info__description {
    type: string
    sql: ${TABLE}.adjustment_info.description ;;
    group_label: "Adjustment Info"
    group_item_label: "Description"
  }

  dimension: adjustment_info__id {
    type: string
    sql: ${TABLE}.adjustment_info.id ;;
    group_label: "Adjustment Info"
    group_item_label: "ID"
  }

  dimension: adjustment_info__mode {
    type: string
    sql: ${TABLE}.adjustment_info.mode ;;
    group_label: "Adjustment Info"
    group_item_label: "Mode"
  }

  dimension: adjustment_info__type {
    type: string
    sql: ${TABLE}.adjustment_info.type ;;
    group_label: "Adjustment Info"
    group_item_label: "Type"
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }

  dimension: credits {
    hidden: yes
    sql: ${TABLE}.credits ;;
  }

  dimension: currency {
    group_label: "Currency"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_conversion_rate {
    group_label: "Currency"
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }

  dimension_group: export {
    type: time
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

  dimension: invoice_month {
    type: string
    sql: ${TABLE}.invoice.month ;;
    # group_label: "Invoice"
    # group_item_label: "Month"
  }

  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }

  dimension: location__country {
    type: string
    sql: ${TABLE}.location.country ;;
    group_label: "Location"
    group_item_label: "Country"
  }

  dimension: location__location {
    type: string
    sql: ${TABLE}.location.location ;;
    group_label: "Location"
    group_item_label: "Location"
  }

  dimension: location__region {
    type: string
    sql: ${TABLE}.location.region ;;
    group_label: "Location"
    group_item_label: "Region"
  }

  dimension: location__zone {
    type: string
    sql: ${TABLE}.location.zone ;;
    group_label: "Location"
    group_item_label: "Zone"
  }

  dimension: project__ancestry_numbers {
    type: string
    sql: ${TABLE}.project.ancestry_numbers ;;
    group_label: "Project"
    group_item_label: "Ancestry Numbers"
  }

  dimension: project__id {
    type: string
    sql: COALESCE(IF(${service__description} = 'Support', 'Support', ${TABLE}.project.id),"Unknown") ;;
    group_label: "Project"
    group_item_label: "ID"
  }

  dimension: project__labels {
    hidden: yes
    sql: ${TABLE}.project.labels ;;
    group_label: "Project"
    group_item_label: "Labels"
  }

  dimension: project__name {
    type: string
    sql: ${TABLE}.project.name ;;
    group_label: "Project"
    group_item_label: "Name"
    link: {
      label: "{% if project__id._value != 'Support' and project__id._value  != 'Unknown' %} View Project in Console {% endif %}"
      url: "https://console.cloud.google.com/home/dashboard?project={{ project__id._value }}"
      icon_url: "https://i.pinimg.com/originals/92/b2/66/92b266df967b8540c94301eacdec391b.png"
    }
    link: {
      label: "Project Deep Dive"
      url: "/dashboards-next/gcp_billing_block::project_deep_dive?Project%20ID={{ project__id._value }}"
    }
  }

  # dimension: project__number {
  #   type: string
  #   sql: ${TABLE}.project.number ;;
  #   group_label: "Project"
  #   group_item_label: "Number"
  # }

  dimension: service__description {
    label: "Service Type"
    type: string
    sql: ${TABLE}.service.description ;;
    group_label: "Service"
    group_item_label: "Description"
    link: {
      label: "{% if value contains 'BigQuery' %} BigQuery Deep Dive {% endif %}"
      url: "/dashboards-next/gcp_billing_block::bigquery_insights?Project%20ID={{ _filters['gcp_billing_export.project__id'] | url_encode }}"
    }
    link: {
      label: "{% if value contains 'Compute Engine' %} Compute Engine Deep Dive {% endif %}"
      url: "/dashboards-next/gcp_billing_block::compute_engine_insights?Project%20ID={{ _filters['gcp_billing_export.project__id'] | url_encode }}"
    }
    link: {
      label: "{% if value contains 'Cloud Storage' %} Cloud Storage Deep Dive {% endif %}"
      url: "/dashboards-next/gcp_billing_block::cloud_storage_insights?Project%20ID={{ _filters['gcp_billing_export.project__id'] | url_encode }}"
    }
  }

  dimension: service__id {
    type: string
    sql: ${TABLE}.service.id ;;
    group_label: "Service"
    group_item_label: "ID"
  }

  dimension: sku__description {
    type: string
    sql: ${TABLE}.sku.description ;;
    group_label: "SKU"
    group_item_label: "Description"
  }

  dimension: sku__id {
    type: string
    sql: ${TABLE}.sku.id ;;
    group_label: "SKU"
    group_item_label: "ID"
  }

  dimension: system_labels {
    hidden: yes
    sql: ${TABLE}.system_labels ;;
  }

  dimension: usage__amount {
    type: number
    sql: ${TABLE}.usage.amount ;;
    group_label: "Usage"
    group_item_label: "Amount"
  }

  dimension: usage__amount_in_pricing_units {
    type: number
    sql: ${TABLE}.usage.amount_in_pricing_units ;;
    group_label: "Usage"
    group_item_label: "Amount In Pricing Units"
  }

  dimension: usage__pricing_unit {
    type: string
    sql: ${TABLE}.usage.pricing_unit ;;
    group_label: "Usage"
    group_item_label: "Pricing Unit"
  }

  dimension: usage__unit {
    type: string
    sql: ${TABLE}.usage.unit ;;
    group_label: "Usage"
    group_item_label: "Unit"
  }

  dimension: usage__calculated_unit {
    type: string
    sql: CASE
      -- VCPU RAM
        WHEN ${usage__pricing_unit} = 'gibibyte hour' THEN 'GB'
      -- VCPU Cores
        WHEN ${usage__pricing_unit} = 'hour' THEN 'Count'
      -- PD Storage
      -- WHEN usage.pricing_unit = 'gibibyte month' THEN ROUND(SUM(usage.amount_in_pricing_units) * 30, 2)
      ELSE ${usage__pricing_unit} END;;
    group_label: "Usage"
    group_item_label: "Calculated Unit"
  }

  dimension_group: usage_end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    sql: ${TABLE}.usage_end_time ;;
  }

  dimension_group: usage_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    sql: ${TABLE}.usage_start_time ;;
  }

  measure: count {
    hidden: no
    type: count
    drill_fields: [project__name]
  }

  measure: usage__amount_in_calculated_units {
    value_format_name: decimal_2
    type: sum
    sql: CASE
      -- VCPU RAM
        WHEN usage.pricing_unit = 'gibibyte hour' THEN ${usage__amount_in_pricing_units}/24
      -- VCPU Cores
        WHEN usage.pricing_unit = 'hour' THEN ${usage__amount_in_pricing_units}/24
      -- PD Storage
      -- WHEN usage.pricing_unit = 'gibibyte month' THEN ROUND(SUM(usage.amount_in_pricing_units) * 30, 2)
      ELSE ${usage__amount_in_pricing_units}
    END;;
    group_item_label: "Total Amount in Calculated Units"
    drill_fields: [project__name,service__description,total_cost, total_usage_amount]
  }

  measure: total_usage_amount {
    type: sum
    sql: ${usage__amount} ;;
    drill_fields: [project__name,service__description,total_cost, total_usage_amount]
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format: "#,##0.00"
    html: <a href="#drillmenu" target="_self">{{ currency_symbol._value }}{{ rendered_value }}</a>;;
    drill_fields: [project__name,service__description,total_cost]
  }

  measure: total_net_cost {
    type: number
    sql: ${total_cost} - ${gcp_billing_export__credits.total_amount};;
    value_format: "#,##0.00"
    html: <a href="#drillmenu" target="_self">{{ currency_symbol._value }}{{ rendered_value }}</a>;;
    drill_fields: [project__name,service__description,total_cost, gcp_billing_export__credits.total_amount]
  }


}

view: gcp_billing_export__labels {
  view_label: "Labels"

  dimension: key {
    group_label: "Billing Export"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    group_label: "Billing Export"
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: gcp_billing_export__credits {
  view_label: "Credits"
  drill_fields: [id]

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: concat(${name},${gcp_billing_export.pk},${amount}) ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: case when ${name} like "%Committed Usage%" then "COMMITTED_USAGE_DISCOUNT"
              when ${name} like "%Sustained Usage%" then "SUSTAINED_USAGE_DISCOUNT"
              else ${TABLE}.type end;;
    drill_fields: [name]
  }

  measure: total_amount {
    label: "Total Credit Amount"
    type: sum
    value_format: "#,##0.00"
    html: <a href="#drillmenu" target="_self">{{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }}</a>;;
    sql: -1*${amount} ;;
    drill_fields: [gcp_billing_export__credits.type,gcp_billing_export__credits.total_amount]
  }

  measure: total_sustained_use_discount {
    view_label: "Credits"
    type: sum
    value_format: "#,##0.00"
    html: <a href="#drillmenu" target="_self">{{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }}</a>;;
    sql: -1*${amount} ;;
    filters: [gcp_billing_export__credits.type: "SUSTAINED_USAGE_DISCOUNT"]
    drill_fields: [gcp_billing_export__credits.id,gcp_billing_export__credits.name,total_amount]
  }

  measure: total_committed_use_discount {
    view_label: "Credits"
    type: sum
    value_format: "#,##0.00"
    html: <a href="#drillmenu" target="_self">{{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }}</a>;;
    sql: -1*${amount} ;;
    filters: [gcp_billing_export__credits.type: "COMMITTED_USAGE_DISCOUNT, COMMITTED_USAGE_DISCOUNT_DOLLAR_BASE"]
    drill_fields: [gcp_billing_export__credits.id,gcp_billing_export__credits.name,total_amount]
  }

  measure: total_promotional_credit {
    view_label: "Credits"
    type: sum
    value_format: "#,##0.00"
    html: <a href="#drillmenu" target="_self">{{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }}</a>;;
    sql: -1*${amount} ;;
    filters: [gcp_billing_export__credits.type: "PROMOTION"]
    drill_fields: [gcp_billing_export__credits.id,gcp_billing_export__credits.name,total_amount]
  }
}

view: gcp_billing_export__system_labels {
  view_label: "Labels"
  dimension: key {
    group_label: "System"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    group_label: "System"
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: gcp_billing_export__project__labels {
  view_label: "Labels"
  dimension: key {
    group_label: "Project"
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value {
     group_label: "Project"
    type: string
    sql: ${TABLE}.value ;;
  }
}
