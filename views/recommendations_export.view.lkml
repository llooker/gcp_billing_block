view: recommendations_export {
  sql_table_name: @{RECOMMENDATION_TABLE};;

  dimension_group: _partitiondate {
    hidden: yes
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
    hidden: yes
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

  dimension: ancestors__organization_id {
    type: string
    description: "Organization to which the recommendation project"
    sql: ${TABLE}.ancestors.organization_id ;;
    group_label: "Ancestors"
    group_item_label: "Organization ID"
  }

  dimension: associated_insights {
    hidden: yes
    sql: ${TABLE}.associated_insights ;;
  }

  dimension: cloud_entity_id {
    type: string
    description: "Value of the project number or billing account id"
    sql: ${TABLE}.cloud_entity_id ;;
  }

  dimension: cloud_entity_type {
    type: string
    description: "Represents what cloud entity type the recommendation was generated for - eg: project number, billing account"
    sql: ${TABLE}.cloud_entity_type ;;
  }

  dimension: description {
    type: string
    description: "Required. Free-form human readable summary in English.
    The maximum length is 500 characters."
    sql: ${TABLE}.description ;;
  }

  dimension_group: last_refresh {
    type: time
    description: "Output only. Last time this recommendation was refreshed by the system that created it in the first place."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_refresh_time ;;
  }

  dimension: location {
    type: string
    description: "Location for which this recommendation is generated"
    sql: ${TABLE}.location ;;
  }

  dimension: name {
    type: string
    description: "Name of recommendation. A project recommendation is represented as
    projects/[PROJECT_NUMBER]/locations/[LOCATION]/recommenders/[RECOMMENDER_ID]/recommendations/[RECOMMENDATION_ID]"
    sql: ${TABLE}.name ;;
  }

  dimension: primary_impact__category {
    type: string
    description: "Category that is being targeted.
    Values can be the following:
    CATEGORY_UNSPECIFIED:
    Default unspecified category. Don't use directly.
    COST:
    Indicates a potential increase or decrease in cost.
    SECURITY:
    Indicates a potential increase or decrease in security.
    PERFORMANCE:
    Indicates a potential increase or decrease in performance."
    sql: ${TABLE}.primary_impact.category ;;
    group_label: "Primary Impact"
    group_item_label: "Category"
  }

  dimension: primary_impact__cost_projection__cost__currency_code {
    type: string
    description: "The 3-letter currency code defined in ISO 4217."
    sql: ${TABLE}.primary_impact.cost_projection.cost.currency_code ;;
    group_label: "Primary Impact Cost Projection Cost"
    group_item_label: "Currency Code"
  }

  dimension: primary_impact__cost_projection__cost__nanos {
    type: number
    description: "Number of nano (10^-9) units of the amount.
    The value must be between -999,999,999 and +999,999,999 inclusive.
    If `units` is positive, `nanos` must be positive or zero.
    If `units` is zero, `nanos` can be positive, zero, or negative.
    If `units` is negative, `nanos` must be negative or zero.
    For example $-1.75 is represented as `units`=-1 and `nanos`=-750,000,000."
    sql: ${TABLE}.primary_impact.cost_projection.cost.nanos ;;
    group_label: "Primary Impact Cost Projection Cost"
    group_item_label: "Nanos"
  }

  dimension: primary_impact__cost_projection__cost__units {
    type: number
    description: "The whole units of the amount. For example if `currencyCode` is `\"USD\"`,
    then 1 unit is one US dollar."
    sql: ${TABLE}.primary_impact.cost_projection.cost.units ;;
    group_label: "Primary Impact Cost Projection Cost"
    group_item_label: "Units"
  }

  dimension: primary_impact__cost_projection__duration__nanos {
    type: number
    description: "Signed fractions of a second at nanosecond resolution of the span
    of time. Durations less than one second are represented with a 0
    `seconds` field and a positive or negative `nanos` field. For durations
    of one second or more, a non-zero value for the `nanos` field must be
    of the same sign as the `seconds` field. Must be from -999,999,999
    to +999,999,999 inclusive."
    sql: ${TABLE}.primary_impact.cost_projection.duration.nanos ;;
    group_label: "Primary Impact Cost Projection Duration"
    group_item_label: "Nanos"
  }

  dimension: primary_impact__cost_projection__duration__seconds {
    type: number
    description: "Signed seconds of the span of time. Must be from -315,576,000,000
    to +315,576,000,000 inclusive. Note: these bounds are computed from:
    60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years"
    sql: ${TABLE}.primary_impact.cost_projection.duration.seconds ;;
    group_label: "Primary Impact Cost Projection Duration"
    group_item_label: "Seconds"
  }

  dimension: primary_impact__security_projection__details_json {
    type: string
    description: "Additional security impact details that is provided by the recommender in JSON
    format."
    sql: ${TABLE}.primary_impact.security_projection.details_json ;;
    group_label: "Primary Impact Security Projection"
    group_item_label: "Details JSON"
  }

  dimension: priority {
    type: string
    description: "Priority of the recommendation:
    PRIORITY_UNSPECIFIED:
    Default unspecified priority. Don't use directly.
    P4:
    Lowest priority.
    P3:
    Second lowest priority.
    P2:
    Second highest priority.
    P1:
    Highest priority."
    sql: ${TABLE}.priority ;;
  }

  dimension: recommendation_details {
    type: string
    description: "Additional details about the recommendation in JSON format"
    sql: ${TABLE}.recommendation_details ;;
  }

  dimension: recommender {
    label: "ID"
    type: string
    description: "Recommender ID of the recommender that has produced this recommendation"
    sql: ${TABLE}.recommender ;;
    # action: {
    #   label: "Change Status"
    #   url: "https://desolate-refuge-53336.herokuapp.com/posts"
    #   # icon_url: "https://sendgrid.com/favicon.ico"
    #   form_param: {
    #     name: "Subject"
    #     type:select
    #     option: {
    #       name: "Mark as Completed"
    #     }
    #     option: {
    #       name: "Mark as Failed"
    #     }
    #   }
    # }
  }

  dimension: recommender_subtype {
    type: string
    description: "Contains an identifier for a subtype of recommendations produced for the
    same recommender. Subtype is a function of content and impact, meaning a
    new subtype will be added when either content or primary impact category
    changes.
    Examples:
    For recommender = \"google.iam.policy.Recommender\",
    recommender_subtype can be one of \"REMOVE_ROLE\"/\"REPLACE_ROLE\""
    sql: ${TABLE}.recommender_subtype ;;
  }

  dimension: state {
    hidden: yes
    type: string
    description: "Output only. The state of the recommendation:
    STATE_UNSPECIFIED:
    Default state. Don't use directly.
    ACTIVE:
    Recommendation is active and can be applied. Recommendations content can
    be updated by Google.
    ACTIVE recommendations can be marked as CLAIMED, SUCCEEDED, or FAILED.
    CLAIMED:
    Recommendation is in claimed state. Recommendations content is
    immutable and cannot be updated by Google.
    CLAIMED recommendations can be marked as CLAIMED, SUCCEEDED, or FAILED.
    SUCCEEDED:
    Recommendation is in succeeded state. Recommendations content is
    immutable and cannot be updated by Google.
    SUCCEEDED recommendations can be marked as SUCCEEDED, or FAILED.
    FAILED:
    Recommendation is in failed state. Recommendations content is immutable
    and cannot be updated by Google.
    FAILED recommendations can be marked as SUCCEEDED, or FAILED.
    DISMISSED:
    Recommendation is in dismissed state.
    DISMISSED recommendations can be marked as ACTIVE."
    sql: ${TABLE}.state ;;
  }

  dimension: target_resources {
    hidden: yes
    sql: ${TABLE}.target_resources ;;
  }

  dimension: service {
    sql: CASE WHEN REGEXP_CONTAINS(${recommender},r'google.compute.') THEN 'Compute Engine' ELSE '' END;;
    drill_fields: [category]
  }

  dimension: category {
    sql: CASE WHEN REGEXP_CONTAINS(${recommender},r'google.compute.disk.') THEN 'Persistent Disk' ELSE 'VM' END;;
  }

  dimension: project_name {
    sql: (select array_to_string(array_agg(REGEXP_EXTRACT(tr, r'.*googleapis.com/projects/(.*)/(?:regions|zones)/.*')),", ") from unnest(target_resources) as tr);;
    link: {
      label: "View Project Recommendations in Console"
      url: "{% unless project_name._value contains ',' %}https://console.cloud.google.com/home/recommendations?project={{ cloud_entity_id._value }}{% endunless %}"
    }
    link: {
      label: "Project Cost Dashboard"
      url: "{% unless project_name._value contains ',' %}/dashboards-next/gcp_billing_block::project_deep_dive?Project%20ID={{ cloud_entity_id._value }}{% endunless %}"
    }
  }

  measure: count {
    hidden: yes
    type: count
  }

  measure: total_savings {
    type: sum
    sql: -1*${primary_impact__cost_projection__cost__units} ;;
    html: <a href="#drillmenu" target="_self">{{ currency_symbol._value }}{{ rendered_value }}</a>;;
    value_format: "#,##0.00"
    drill_fields: [recommender, priority, project_name, service, category, recommender_subtype, description, last_refresh_date]
  }
}

# view: recommendations_export__target_resources {
#   dimension: target_resources {
#     type: string
#     description: "Contains the fully qualified resource names for resources changed by the
#     operations in this recommendation. This field is always populated. ex:
#     [//cloudresourcemanager.googleapis.com/projects/foo]."
#     sql: recommendations_export__target_resources ;;
#   }

#   dimension: project_name {
#     sql: REGEXP_EXTRACT(${target_resources}, r'.*googleapis.com/projects/(.*)/(?:regions|zones)/.*');;
#   }
# }

# view: recommendations_export__associated_insights {
#   dimension: recommendations_export__associated_insights {
#     type: string
#     description: "Insights associated with this recommendation. A project insight is represented as
#     projects/[PROJECT_NUMBER]/locations/[LOCATION]/insightTypes/[INSIGHT_TYPE_ID]/insights/[insight_id]"
#     sql: recommendations_export__associated_insights ;;
#   }
# }
