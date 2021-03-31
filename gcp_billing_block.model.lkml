connection: "leigha-bq-dev"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project


explore: gcp_billing_export {
  join: gcp_billing_export__labels {
    view_label: "Gcp Billing Export Ctg: Labels"
    sql: LEFT JOIN UNNEST(${gcp_billing_export.labels}) as gcp_billing_export__labels ;;
    relationship: one_to_many
  }

  join: gcp_billing_export__credits {
    sql: LEFT JOIN UNNEST(${gcp_billing_export.credits}) as gcp_billing_export__credits ;;
    relationship: one_to_many
  }

  join: gcp_billing_export__system_labels {
    sql: LEFT JOIN UNNEST(${gcp_billing_export.system_labels}) as gcp_billing_export__system_labels ;;
    relationship: one_to_many
  }

  join: gcp_billing_export__project__labels {
    sql: LEFT JOIN UNNEST(${gcp_billing_export.project__labels}) as gcp_billing_export__project__labels ;;
    relationship: one_to_many
  }
}
