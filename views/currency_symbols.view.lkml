include: "gcp_billing_export.view.lkml"
include: "recommendations_export.view.lkml"

view: +gcp_billing_export {
  dimension: currency_symbol {
    hidden: yes
    sql:  CASE
          WHEN ${currency} = 'USD' THEN '$'
          WHEN ${currency} = 'EUR' THEN '€'
          WHEN ${currency} = 'JPY' THEN '¥'
          WHEN ${currency} = 'AUD'THEN 'A$'
          WHEN ${currency} = 'BRL'THEN 'R$'
          WHEN ${currency} = 'CAD'THEN 'C$'
          WHEN ${currency} = 'HKD' THEN 'HK$'
          WHEN ${currency} = 'INR' THEN '₹'
          WHEN ${currency} = 'IDR' THEN 'Rp'
          WHEN ${currency} = 'ILS' THEN '₪'
          WHEN ${currency} = 'MXN' THEN 'Mex$'
          WHEN ${currency} = 'NZD' THEN 'NZ$'
          WHEN ${currency} = 'GBP' THEN '£'
          ELSE CONCAT(${currency}, ' ')
        END;;
    }
}

view: +recommendations_export {
  dimension: currency_symbol {
    hidden: yes
    sql:  CASE
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'USD' THEN '$'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'EUR' THEN '€'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'JPY' THEN '¥'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'AUD'THEN 'A$'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'BRL'THEN 'R$'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'CAD'THEN 'C$'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'HKD' THEN 'HK$'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'INR' THEN '₹'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'IDR' THEN 'Rp'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'ILS' THEN '₪'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'MXN' THEN 'Mex$'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'NZD' THEN 'NZ$'
          WHEN ${primary_impact__cost_projection__cost__currency_code} = 'GBP' THEN '£'
          ELSE CONCAT(${primary_impact__cost_projection__cost__currency_code}, ' ')
        END;;
  }
}
