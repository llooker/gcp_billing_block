connection: "leigha-bq-dev"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

datagroup:billing_datagroup {
  sql_trigger: select max(export_time) from `data-analytics-pocs.public.billing_dashboard_export`;;
  description: "Triggers a rebuild when new data is exported"
}

explore: gcp_billing_export {
  join: gcp_billing_export__labels {
    sql: ,UNNEST(${gcp_billing_export.labels}) as gcp_billing_export__labels ;;
    relationship: one_to_one
  }

  join: gcp_billing_export__credits {
    sql: ,UNNEST(${gcp_billing_export.credits}) as gcp_billing_export__credits ;;
    relationship: one_to_many
  }

  join: gcp_billing_export__system_labels {
    sql: ,UNNEST(${gcp_billing_export.system_labels}) as gcp_billing_export__system_labels ;;
    relationship: one_to_many
  }

  join: gcp_billing_export__project__labels {
    sql: ,UNNEST(${gcp_billing_export.project__labels}) as gcp_billing_export__project__labels ;;
    relationship: one_to_many
  }
}
