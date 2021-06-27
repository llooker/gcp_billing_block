- dashboard: bigquery_insights
  title: BigQuery Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: 'Analysis: Usage and Cost Insights'
    type: text
    title_text: 'Analysis: Usage and Cost Insights'
    subtitle_text: ''
    body_text: BigQuery offers on-demand and flat-rate [pricing models](https://cloud.google.com/bigquery/pricing#queries).
      If you are a high volume customer with predictable and/or stable workload, you
      may find it cost effective to switch from on-demand to flat-rate pricing. You
      can view your current slot utilization using [INFORMATION_SCHEMA](https://cloud.google.com/bigquery/docs/monitoring#information_schema_views)
      to make an informed decision. Checkout other [BigQuery Cost Optimization](https://cloud.google.com/blog/products/data-analytics/cost-optimization-best-practices-for-bigquery)
      best practices for more details.
    row: 3
    col: 4
    width: 16
    height: 3
  - name: <strong><font color="#000000 " size="6" weight="bold">BigQuery Cost Insights</font><strong>
    type: text
    title_text: <strong><font color="#000000 " size="6" weight="bold">BigQuery Cost
      Insights</font><strong>
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 4
    width: 16
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 0
    col: 0
    width: 4
    height: 3
  - name: "​Storage: Usage and Cost Insights"
    type: text
    title_text: "​Storage: Usage and Cost Insights"
    subtitle_text: ''
    body_text: 'If your BigQuery table or partition of a table has not been edited
      for 90 days, the price of the data stored in the table automatically drops by
      about 50% and is considered for [long-term storage](https://cloud.google.com/bigquery/docs/best-practices-storage#take_advantage_of_long-term_storage).
      Checkout more details and best practices to reduce your storage cost in our
      [best practices blog.](https://cloud.google.com/blog/products/data-analytics/cost-optimization-best-practices-for-bigquery)  '
    row: 23
    col: 4
    width: 16
    height: 3
  - name: 'Streaming Inserts: Usage and Cost Insights'
    type: text
    title_text: 'Streaming Inserts: Usage and Cost Insights'
    subtitle_text: ''
    body_text: "​Use streaming inserts only if your data must be immediately available.There\
      \ is no charge for batch [loading data](https://cloud.google.com/bigquery/docs/loading-data)\
      \ into BigQuery. There is a charge, however, for [streaming data](https://cloud.google.com/bigquery/streaming-data-into-bigquery)\
      \ into BigQuery. Unless your data must be immediately available, batch load\
      \ your data rather than streaming it."
    row: 13
    col: 4
    width: 16
    height: 3
  - title: Analysis Unit
    name: Analysis Unit
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage__amount_in_calculated_units, gcp_billing_export.usage_start_month,
      pricing.pricing_type]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: BigQuery%
      pricing.pricing_category: Analytics
      pricing.pricing_type: Analysis%,Flat rate%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 6
    col: 0
    width: 12
    height: 7
  - title: Storage Unit
    name: Storage Unit
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage__amount_in_calculated_units, gcp_billing_export.usage_start_month,
      pricing.pricing_type]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: BigQuery%
      pricing.pricing_category: Analytics
      pricing.pricing_type: Storage%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 26
    col: 0
    width: 12
    height: 7
  - title: Streaming Unit
    name: Streaming Unit
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage__amount_in_calculated_units, gcp_billing_export.usage_start_month,
      pricing.pricing_type]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: BigQuery%
      pricing.pricing_category: Analytics
      pricing.pricing_type: Streaming%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 16
    col: 0
    width: 12
    height: 7
  - title: Analysis Cost
    name: Analysis Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, pricing.pricing_type, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: BigQuery%
      pricing.pricing_category: Analytics
      pricing.pricing_type: Analysis%,Flat rate%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 6
    col: 12
    width: 12
    height: 7
  - title: Streaming Cost
    name: Streaming Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, pricing.pricing_type, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: BigQuery%
      pricing.pricing_category: Analytics
      pricing.pricing_type: Streaming%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 16
    col: 12
    width: 12
    height: 7
  - title: Storage Cost
    name: Storage Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, pricing.pricing_type, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: BigQuery%
      pricing.pricing_category: Analytics
      pricing.pricing_type: Storage%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 26
    col: 12
    width: 12
    height: 7
  filters:
  - name: Project ID
    title: Project ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.project__id
