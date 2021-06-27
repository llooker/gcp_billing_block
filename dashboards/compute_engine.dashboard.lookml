- dashboard: compute_engine_insights
  title: Compute Engine Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: 'Cores: Usage and Cost Insights'
    type: text
    title_text: 'Cores: Usage and Cost Insights'
    subtitle_text: ''
    body_text: 'The graphs below show your core usage and spend for Compute Engine,
      Dataproc and Google Kubernetes Engine, which are covered by [commitments](https://cloud.google.com/compute/docs/instances/signing-up-committed-use-discounts).
      Workloads that are stable and predictable, in terms of resource need, can greatly
      benefit from commitments. Checkout the [Committed Use Discount recommendations](https://cloud.google.com/compute/docs/instances/signing-up-committed-use-discounts#recommendations)
      to optimize your cost without impacting performance. Checkout [this whitepaper](https://cloud.google.com/blog/products/compute/5-best-practices-compute-engine-cost-optimization)
      for more best practices.  '
    row: 3
    col: 4
    width: 16
    height: 3
  - name: <strong><font color="#000000 " size="6" weight="bold">Compute Engine Cost
      Insights</font><strong>
    type: text
    title_text: <strong><font color="#000000 " size="6" weight="bold">Compute Engine
      Cost Insights</font><strong>
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
  - name: "​Memory Instance Generation: Usage and Cost Insights"
    type: text
    title_text: "​Memory Instance Generation: Usage and Cost Insights"
    subtitle_text: ''
    body_text: "​​The graphs below show the instance generation and resource types\
      \ you have been using. Compute Engine offers pre-defined and custom machine\
      \ types to best handle your workloads. Leverage [newer generation](https://cloud.google.com/compute/docs/machine-types#recommendations_for_machine_types)\
      \ instances and [Pre-emptible VMs](https://cloud.google.com/compute/docs/instances/preemptible)\
      \ where possible, as that can result in significant savings. Checkout the [whitepaper\
      \ ](https://cloud.google.com/blog/products/compute/5-best-practices-compute-engine-cost-optimization)for\
      \ more best practices.  "
    row: 33
    col: 4
    width: 16
    height: 3
  - name: 'Memory: Usage and Cost Insights'
    type: text
    title_text: 'Memory: Usage and Cost Insights'
    subtitle_text: ''
    body_text: "​The graphs below show your memory usage and spend for Compute Engine,\
      \ Dataproc and Google Kubernetes Engine that are covered by [commitments](https://cloud.google.com/compute/docs/instances/signing-up-committed-use-discounts).\
      \ Workloads that are stable and predictable in terms of resource need can greatly\
      \ benefit from commitments. Checkout the [Committed Use Discount](https://cloud.google.com/compute/docs/instances/signing-up-committed-use-discounts#recommendations)\
      \ recommendations to optimize your cost without impacting performance. Checkout\
      \ this [whitepaper](https://cloud.google.com/blog/products/compute/5-best-practices-compute-engine-cost-optimization)\
      \ for more best practices.  "
    row: 23
    col: 4
    width: 16
    height: 3
  - name: 'Cores Instance Generation: Usage and Cost Insights'
    type: text
    title_text: 'Cores Instance Generation: Usage and Cost Insights'
    subtitle_text: ''
    body_text: "​The graphs below show the instance generation and resource types\
      \ you have been using. Compute Engine offers pre-defined and custom machine\
      \ types to best handle your workloads. Leverage [newer generation](https://cloud.google.com/compute/docs/machine-types#recommendations_for_machine_types)\
      \ instances and [Pre-emptible VMs](https://cloud.google.com/compute/docs/instances/preemptible)\
      \ where possible, as that can result in significant savings. Checkout the [whitepaper\
      \ ](https://cloud.google.com/blog/products/compute/5-best-practices-compute-engine-cost-optimization)for\
      \ more best practices.  "
    row: 13
    col: 4
    width: 16
    height: 3
  - name: "​​Persistent Disk: Usage and Cost Insights"
    type: text
    title_text: "​​Persistent Disk: Usage and Cost Insights"
    subtitle_text: ''
    body_text: "​[Persistent disks](https://cloud.google.com/compute/docs/disks) are\
      \ durable network storage devices that your instances can access like physical\
      \ disks in a desktop or a server. In the graphs below, you can see cost and\
      \ usage across Standard / Balanced / SSD disks along with snapshot usage. You\
      \ can improve cost-performance by doing the following: Delete/snapshot [Idle\
      \ disks](https://cloud.google.com/recommender/docs/recommenders), leverage appropriate\
      \ [disk type](https://cloud.google.com/compute/docs/disks#disk-types), [snapshot\
      \ retention lifecycle,](https://cloud.google.com/compute/docs/disks/scheduled-snapshots)\
      \ use other options like [Cloud Storage](https://cloud.google.com/compute/docs/disks/gcs-buckets#mount_bucket)\
      \ for Media and logs, etc. "
    row: 43
    col: 4
    width: 16
    height: 3
  - title: Cores Usage Amount by Type
    name: Cores Usage Amount by Type
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage__amount_in_calculated_units, gcp_billing_export.usage_start_month,
      pricing.pricing_usage_type]
    pivots: [pricing.pricing_usage_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: Cores%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_usage_type]
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
    listen: {}
    row: 6
    col: 0
    width: 12
    height: 7
  - title: Cores Cost by Usage Type
    name: Cores Cost by Usage Type
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, pricing.pricing_usage_type, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_usage_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: Cores%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_usage_type]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    listen: {}
    row: 6
    col: 12
    width: 12
    height: 7
  - title: Core Instance Generation
    name: Core Instance Generation
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [pricing.pricing_type, pricing.pricing_sub_type, pricing.pricing_usage_type,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: Cores%
    sorts: [pricing.pricing_type]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
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
    defaults_version: 1
    series_types: {}
    title_hidden: true
    listen: {}
    row: 16
    col: 0
    width: 24
    height: 7
  - title: Cores Cost by Usage Type (Copy)
    name: Cores Cost by Usage Type (Copy)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, pricing.pricing_usage_type, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_usage_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: ''
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_usage_type]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    row: 26
    col: 12
    width: 12
    height: 7
  - title: Cores Usage Amount by Type (Copy)
    name: Cores Usage Amount by Type (Copy)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage__amount_in_calculated_units, gcp_billing_export.usage_start_month,
      pricing.pricing_usage_type]
    pivots: [pricing.pricing_usage_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: RAM%
    sorts: [gcp_billing_export.usage_start_month desc, pricing.pricing_usage_type]
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
    row: 26
    col: 0
    width: 12
    height: 7
  - title: Core Instance Generation (Copy)
    name: Core Instance Generation (Copy)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [pricing.pricing_type, pricing.pricing_sub_type, pricing.pricing_usage_type,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: RAM%
    sorts: [pricing.pricing_type]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
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
    defaults_version: 1
    series_types: {}
    title_hidden: true
    row: 36
    col: 0
    width: 24
    height: 7
  - title: Persisten Disk Usage Last 7 Days
    name: Persisten Disk Usage Last 7 Days
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_date, pricing.pricing_type, gcp_billing_export.usage__calculated_unit,
      gcp_billing_export.usage__amount_in_calculated_units]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: Persistent Disk
      gcp_billing_export.usage_start_date: 7 days
    sorts: [gcp_billing_export.usage_start_date desc]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
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
    defaults_version: 1
    series_types: {}
    title_hidden: true
    listen: {}
    row: 46
    col: 0
    width: 12
    height: 8
  - title: Persistent Disk Usage
    name: Persistent Disk Usage
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: Persistent Disk
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
    listen: {}
    row: 46
    col: 12
    width: 12
    height: 8
  - title: Network Costs
    name: Network Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: Network
      pricing.pricing_type: Egress%,Ingress%
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
    listen: {}
    row: 58
    col: 12
    width: 12
    height: 8
  - title: Network Calculated Units
    name: Network Calculated Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: Network
      pricing.pricing_type: Egress%,Ingress%
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
    listen: {}
    row: 58
    col: 0
    width: 12
    height: 8
  - name: 'Network: Usage and Cost Insights'
    type: text
    title_text: 'Network: Usage and Cost Insights'
    subtitle_text: ''
    body_text: The graphs below show your networking usage and cost on Google Cloud.
      For full details on pricing, follow our [public documentation.](https://cloud.google.com/vpc/network-pricing)
      There are various ways you can optimize - including selecting the right Network
      Service Tier, customizing logs and more. Checkout our [Networking best practices
      blog](https://cloud.google.com/blog/products/networking/networking-cost-optimization-best-practices)
      and this [whitepaper](https://cloud.google.com/blog/topics/cost-management/principles-of-cloud-cost-optimization)
      for more details.
    row: 54
    col: 4
    width: 15
    height: 4
