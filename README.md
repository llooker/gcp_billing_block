**NOTE: This block requires the billing data export and recommendations data export be set up with a Big Query sink and the export running daily. See this link for [more information on setting up the billing export](https://cloud.google.com/billing/docs/how-to/export-data-bigquery), this link for [more information on setting up the recommendations export](https://cloud.google.com/recommender/docs/bq-export/export-recommendations-to-bq#creating_a_data_transfer_for_recommendations), and make sure data is in BigQuery before attempting to use this block:**

___
# Readme: Google Cloud Billing Looker Block

### What does this Block do for me?

With the Google Cloud Billing Block, you can:

1. Identify projects and services with high spend to further optimize
2. Analyze service-specific reports to determine areas where costs can be cu
3. Understand where credits and promotional offerings are being used to plan for saving on future spend
4. Use the recommendations data to make immediate changes to inefficient spend

### Block Info & Structure

This block is modeled on the [Google Cloud Billing Export schema](https://cloud.google.com/billing/docs/how-to/export-data-bigquery#data-tables) as well as the [Recommendations and Insights schema](https://cloud.google.com/recommender/docs/bq-export/export-recommendations-to-bq#example_queries). 

There are several view files:
- [gcp_billing_export](/views/gcp_billing_export.view.lkml) - fields modeled on top of the Google Cloud Billing Export table
- [cloud_pricing_export](/views/cloud_pricing_export.view.lkml) - fields modeled on top of the Pricing table from the Cloud Billing Export
- [recommendations_export](/views/recommendations_export.view.lkml) - fields modeled on top of the Recommendations Export
- [period_over_period](/views/period_over_period.view.lkml) - fields specific to period over period analysis, for example looking at current Year to Date spend compared to Prior
- [currency_symbols](/views/currency_symbols.view.lkml) - customizes the html for spend metrics to include the currency symbol specific to the currency set in the billing export

### Customizing the Model

When you install this block into your Looker instance using the marketplace, you can create custom fields in the refinements.lkml file. 

#### Leveraging Labels as Custom Dimensions

In Google Cloud, project labels can be used to specify things like the team who owns the project or the cost center for billing. The Project labels are available as an array of key value pairs. If we were storing the label using the key 'cost_center' then we could create a dimensions specifically for cost center using the LookML like below. 

```
view: +gcp_billing_export__project__labels {
  dimension: cost_center {
    type:string
    sql: case when ${key} = 'cost_center' then ${value} else null end;;
  }
}
```

#### Incorporating Folder Hierarchy and Project Owners (Coming Soon)

#### Taking Action on Remcommendations (Coming Soon)

