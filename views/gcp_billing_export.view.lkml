view: gcp_billing_export {
  view_label: "Billing"
  sql_table_name: `data-analytics-pocs.public.billing_dashboard_export`;;

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

  dimension: pk {
    hidden: no
    primary_key: yes
    sql: CONCAT(IFNULL(CAST(${export_raw} as string), ''),
                IFNULL(${sku__id}, ''),
                IFNULL(${service__id}, ''),
                IFNULL(${project__id}, ''),
                IFNULL(${cost_type}, ''),
                IFNULL(${location__region}, ''),
                IFNULL(CAST(${usage__amount} as string), ''),
                IFNULL(CAST(${usage_start_raw} as string), ''));;
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
      url: "/dashboards-next/63?Project%20ID={{ project__id._value }}"
    }
  }

  dimension: project__number {
    type: string
    sql: ${TABLE}.project.number ;;
    group_label: "Project"
    group_item_label: "Number"
  }

  dimension: service__description {
    label: "Service Type"
    type: string
    sql: ${TABLE}.service.description ;;
    group_label: "Service"
    group_item_label: "Description"
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

  measure: total_usage_amount {
    type: sum
    sql: ${usage__amount} ;;
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format: "#,##0.00"
    html: {{ currency_symbol._value }}{{ rendered_value }};;
    drill_fields: [project__name,service__description,total_cost]
  }

  measure: total_net_cost {
    type: number
    sql: ${total_cost} - ${gcp_billing_export__credits.total_amount};;
    value_format: "#,##0.00"
    html: {{ currency_symbol._value }}{{ rendered_value }};;
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
    sql: ${TABLE}.type ;;
    drill_fields: [name]
  }

  measure: total_amount {
    label: "Total Credit Amount"
    type: sum
    value_format: "#,##0.00"
    html: {{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }};;
    sql: -1*${amount} ;;
    drill_fields: [type,total_amount]
  }

  measure: total_sustained_use_discount {
    type: sum
    value_format: "#,##0.00"
    html: {{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }};;
    sql: -1*${amount} ;;
    filters: [type: "SUSTAINED_USAGE_DISCOUNT"]
    drill_fields: [id,name,total_amount]
  }

  measure: total_committed_use_discount {
    type: sum
    value_format: "#,##0.00"
    html: {{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }};;
    sql: -1*${amount} ;;
    filters: [type: "COMMITTED_USAGE_DISCOUNT, COMMITTED_USAGE_DISCOUNT_DOLLAR_BASE"]
    drill_fields: [id,name,total_amount]
  }

  measure: total_promotional_credit {
    type: sum
    value_format: "#,##0.00"
    html: {{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }};;
    sql: -1*${amount} ;;
    filters: [type: "PROMOTION"]
    drill_fields: [id,name,total_amount]
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
