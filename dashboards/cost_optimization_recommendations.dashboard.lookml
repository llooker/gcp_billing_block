- dashboard: cost_optimization_recommendations
  title: Cost Optimization Recommendations
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Total Savings
    name: Total Savings
    model: gcp_billing_block
    explore: recommendations_export
    type: single_value
    fields: [recommendations_export.total_savings]
    filters:
      recommendations_export.service: Compute Engine
      recommendations_export.category: VM
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Project ID: recommendations_export.cloud_entity_id
    row: 4
    col: 19
    width: 5
    height: 3
  - name: VM Recommendations
    type: text
    title_text: VM Recommendations
    subtitle_text: ''
    body_text: 'Compute Engine provides idle recommendations to help you identify
      virtual machine (VM) instances that have not been used or could benefit from
      purchasing additional commitments. You can use idle VM recommendations to find
      and stop idle VM instances to reduce waste of resources as well as use CUD recommender
      to optimize commitments. [Checkout more information in our public documentation.](https://cloud.google.com/recommender/docs/recommenders) '
    row: 4
    col: 3
    width: 16
    height: 3
  - name: Persistent Disk Recommendations
    type: text
    title_text: Persistent Disk Recommendations
    subtitle_text: ''
    body_text: Compute Engine provides recommendations to help you identify persistent
      disks (PDs) that haven't been attached to any virtual machine (VM) instance.
      You can use idle persistent disk recommendations to help minimize waste of resources
      and reduce your compute bill. For PDs that are not actively used, create a backup
      snapshot and delete the PD. [Checkout more information in our public documentation.](https://cloud.google.com/recommender/docs/recommenders)
    row: 17
    col: 3
    width: 16
    height: 3
  - title: Total Savings
    name: Total Savings (2)
    model: gcp_billing_block
    explore: recommendations_export
    type: single_value
    fields: [recommendations_export.total_savings]
    filters:
      recommendations_export.service: Compute Engine
      recommendations_export.category: Persistent Disk
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Project ID: recommendations_export.cloud_entity_id
    row: 17
    col: 19
    width: 5
    height: 3
  - title: VM Recommendations
    name: VM Recommendations (2)
    model: gcp_billing_block
    explore: recommendations_export
    type: looker_grid
    fields: [recommendations_export.last_refresh_date, recommendations_export.project_name,
      recommendations_export.description, recommendations_export.location, recommendations_export.recommender_subtype,
      recommendations_export.total_savings]
    filters:
      recommendations_export.service: Compute Engine
      recommendations_export.category: VM
    sorts: [recommendations_export.project_name]
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
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: recommendations_export.total_savings,
            id: recommendations_export.total_savings, name: Total Savings}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    legend_position: center
    series_types: {}
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
    title_hidden: true
    listen:
      Project ID: recommendations_export.cloud_entity_id
    row: 7
    col: 0
    width: 16
    height: 8
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<p></p>\n"
    row: 15
    col: 0
    width: 24
    height: 2
  - title: VM Recommendations
    name: VM Recommendations (3)
    model: gcp_billing_block
    explore: recommendations_export
    type: looker_column
    fields: [recommendations_export.project_name, recommendations_export.recommender_subtype,
      recommendations_export.total_savings]
    pivots: [recommendations_export.recommender_subtype]
    filters:
      recommendations_export.service: Compute Engine
      recommendations_export.category: VM
    sorts: [recommendations_export.project_name, recommendations_export.recommender_subtype]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: recommendations_export.total_savings,
            id: recommendations_export.total_savings, name: Total Savings}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
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
    defaults_version: 1
    title_hidden: true
    listen:
      Project ID: recommendations_export.cloud_entity_id
    row: 7
    col: 16
    width: 8
    height: 8
  - title: PD Recommendations
    name: PD Recommendations
    model: gcp_billing_block
    explore: recommendations_export
    type: looker_grid
    fields: [recommendations_export.last_refresh_date, recommendations_export.project_name,
      recommendations_export.description, recommendations_export.location, recommendations_export.recommender_subtype,
      recommendations_export.total_savings]
    filters:
      recommendations_export.category: Persistent Disk
      recommendations_export.service: Compute Engine
    sorts: [recommendations_export.project_name]
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
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: recommendations_export.total_savings,
            id: recommendations_export.total_savings, name: Total Savings}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    legend_position: center
    series_types: {}
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
    title_hidden: true
    listen:
      Project ID: recommendations_export.cloud_entity_id
    row: 20
    col: 0
    width: 16
    height: 8
  - title: PD Recommendations
    name: PD Recommendations (2)
    model: gcp_billing_block
    explore: recommendations_export
    type: looker_column
    fields: [recommendations_export.project_name, recommendations_export.recommender_subtype,
      recommendations_export.total_savings]
    pivots: [recommendations_export.recommender_subtype]
    filters:
      recommendations_export.service: Compute Engine
      recommendations_export.category: Persistent Disk
    sorts: [recommendations_export.project_name, recommendations_export.recommender_subtype]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: recommendations_export.total_savings,
            id: recommendations_export.total_savings, name: Total Savings}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
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
    defaults_version: 1
    title_hidden: true
    listen:
      Project ID: recommendations_export.cloud_entity_id
    row: 20
    col: 16
    width: 8
    height: 8
  - name: <strong><font color="#000000 " size="6" weight="bold">Cost Optimization
      Recommendations</font><strong>
    type: text
    title_text: <strong><font color="#000000 " size="6" weight="bold">Cost Optimization
      Recommendations</font><strong>
    subtitle_text: "<i>Overview of Recommendations for Saving Costs on Certain Projects\
      \ </i>"
    body_text: ''
    row: 0
    col: 5
    width: 15
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 0
    col: 0
    width: 5
    height: 3
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
    explore: recommendations_export
    listens_to_filters: []
    field: recommendations_export.cloud_entity_id
