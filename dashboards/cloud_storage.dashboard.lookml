- dashboard: cloud_storage_insights
  title: Cloud Storage Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: <strong><font color="#000000 " size="6" weight="bold">Cloud Storage Cost
      Insights</font><strong>
    type: text
    title_text: <strong><font color="#000000 " size="6" weight="bold">Cloud Storage
      Cost Insights</font><strong>
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 4
    width: 15
    height: 3
  - name: 'Data Retrieval: Usage and Cost Insights'
    type: text
    title_text: 'Data Retrieval: Usage and Cost Insights'
    subtitle_text: ''
    body_text: "​Because Nearline, Coldline, and Archive Storage are intended for\
      \ storing infrequently accessed data, there are additional costs associated\
      \ with retrieving data or metadata stored in these classes. Make sure to keep\
      \ [retrieval costs](https://cloud.google.com/storage/pricing#archival-pricing)\
      \ in check and leverage appropriate storage classes as per your use-case. Checkout\
      \ our [Cloud Storage best practice blog](https://cloud.google.com/blog/products/storage-data-transfer/best-practices-for-cloud-storage-cost-optimization)\
      \ for more details. "
    row: 13
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
  - name: 'Data Operations: Usage and Cost Insights'
    type: text
    title_text: 'Data Operations: Usage and Cost Insights'
    subtitle_text: ''
    body_text: "​[Operation charges](https://cloud.google.com/storage/pricing#operations-pricing)\
      \ apply when you perform operations within Cloud Storage. An operation is an\
      \ action that makes changes to or retrieves information about buckets and objects\
      \ in Cloud Storage. It is good practice to be aware of your operations cost\
      \ and find areas for efficiency where you can."
    row: 33
    col: 4
    width: 16
    height: 3
  - name: 'Cloud Storage: Usage and Cost Insights'
    type: text
    title_text: 'Cloud Storage: Usage and Cost Insights'
    subtitle_text: ''
    body_text: 'Save costs without sacrificing performance by storing data across
      different storage classes ([Standard](https://cloud.google.com/storage/docs/storage-classes#standard),
      [Nearline](https://cloud.google.com/storage/docs/storage-classes#nearline),
      [Coldline](https://cloud.google.com/storage/docs/storage-classes#coldline),
      and [Archive](https://cloud.google.com/storage/docs/storage-classes#archive)).
      You can start with a class that matches your current use, then reconfigure for
      cost savings. You can use various features like Object Lifecycle Management,
      Versioning, Retention policies, bucket hold and several [more](https://cloud.google.com/storage#all-features)
      feature to optimize your storage for cost and performance. Checkout our [whitepaper](https://cloud.google.com/blog/topics/cost-management/principles-of-cloud-cost-optimization)
      for more details. '
    row: 3
    col: 4
    width: 16
    height: 3
  - name: 'Early Deletes: Usage and C​ost Insights'
    type: text
    title_text: 'Early Deletes: Usage and C​ost Insights'
    subtitle_text: ''
    body_text: "​​Because Nearline, Coldline, and Archive Storage are intended for\
      \ storing infrequently accessed data, there are additional costs associated\
      \ with the minimum storage durations that you are charged for. You can delete\
      \ the file before it has been stored for this duration, but at the time of deletion\
      \ you are charged as if the file was stored for the minimum duration. These\
      \ are billed as [early delete](https://cloud.google.com/storage/pricing#archival-pricing),\
      \ make sure to keep these in check. Checkout our [whitepaper](https://cloud.google.com/blog/topics/cost-management/principles-of-cloud-cost-optimization)\
      \ for more details.  "
    row: 23
    col: 4
    width: 16
    height: 3
  - name: 'Network: Usage and Cost Insights'
    type: text
    title_text: 'Network: Usage and Cost Insights'
    subtitle_text: ''
    body_text: "​[Network usage](https://cloud.google.com/storage/pricing#network-pricing)\
      \ charges apply when object data or object metadata is read from your Cloud\
      \ Storage buckets. Network usage is divided into Network egress, general network\
      \ usage and other speciality network services that you are using. Understanding\
      \ where you costs are concentrated can help you optimize network costs and performance.\
      \ For more on networking, checkout our [whitepaper](https://cloud.google.com/blog/topics/cost-management/principles-of-cloud-cost-optimization)\
      \ for more details. "
    row: 43
    col: 4
    width: 16
    height: 3
  - title: Data Storage Units
    name: Data Storage Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Data Storage
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 6
    col: 0
    width: 12
    height: 7
  - title: Data Retrieval Units
    name: Data Retrieval Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Data Retrieval
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 16
    col: 0
    width: 12
    height: 7
  - title: Early Deletes Units
    name: Early Deletes Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Early Deletes
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 26
    col: 0
    width: 12
    height: 7
  - title: Operations Units
    name: Operations Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Operations
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 36
    col: 0
    width: 12
    height: 7
  - title: Network Units
    name: Network Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Network
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 46
    col: 0
    width: 12
    height: 8
  - title: Data Retrieval Cost
    name: Data Retrieval Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Data Retrieval
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 16
    col: 12
    width: 12
    height: 7
  - title: Data Storage Cost
    name: Data Storage Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Data Storage
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 6
    col: 12
    width: 12
    height: 7
  - title: Early Deletes Cost
    name: Early Deletes Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Early Deletes
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 26
    col: 12
    width: 12
    height: 7
  - title: Network Cost
    name: Network Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Network
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 46
    col: 12
    width: 12
    height: 8
  - title: Operations Cost
    name: Operations Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Operations
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      Project ID: gcp_billing_export.project__id
    row: 36
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
