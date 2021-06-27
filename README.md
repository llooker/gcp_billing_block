**NOTE: This block requires the billing data export and recommendations data export be set up with a Big Query sink and the export running daily. See this link for [more information on setting up the billing export](https://cloud.google.com/billing/docs/how-to/export-data-bigquery), this link for [more information on setting up the recommendations export](https://cloud.google.com/recommender/docs/bq-export/export-recommendations-to-bq#creating_a_data_transfer_for_recommendations), and make sure data is in BigQuery before attempting to use this block. If you don't want to use the recommendations export, you may want to hide the reccomendations_export explore and the Recommendations Dashboard will show errors**

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

Note: this block leverages [presistent derived tables](https://docs.looker.com/data-modeling/learning-lookml/derived-tables#temporary_and_persistent_derived_tables) and [incremental derived tables](https://docs.looker.com/data-modeling/learning-lookml/derived-tables#incrementally_building_pdts). Please make sure these are enabled in your Looker instance in order to use.

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

#### Incorporating Folder Hierarchy and Project Owners

You may want to perform some analyses that leverage the Google Cloud folder structure. For example, if one department has all projects within a folder you can slice data by that folder to see department level metrics. One way to accomplish this would be to leverage this open source [Cloud Function](https://github.com/pmenglund/folder-lookup) to pipe resource hierarchy data into BigQuery. You will then need to add additional views into the project.

#### Taking Action on Remcommendations

When using the recommendations data, you may want to mark a recommendation as claimed if you plan to apply the recommended chanes. In Looker, you can use a [field-level action](https://docs.looker.com/reference/field-params/action) to send a POST request to [an action server](https://docs.looker.com/sharing-and-publishing/action-hub#building_a_custom_action) and hit the [recommendations API.](https://cloud.google.com/recommender/docs/using-api#mark_a_recommendation_as_claimed)
