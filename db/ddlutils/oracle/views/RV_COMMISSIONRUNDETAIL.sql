DROP VIEW rv_commissionrundetail;

CREATE OR REPLACE VIEW rv_commissionrundetail
AS
  SELECT cr.ad_client_id,
         cr.ad_org_id,
         cr.isactive,
         cr.created,
         cr.createdby,
         cr.updated,
         cr.updatedby,
         cr.c_commissionrun_id,
         cr.documentno,
         cr.description,
         cr.startdate,
         cr.grandtotal,
         cr.processed,
         c.c_commission_id,
         c.c_bpartner_id                                              AS commission_bpartner_id,
         ca.c_commissionamt_id,
         ca.convertedamt                                              AS commissionconvertedamt,
         ca.actualqty                                                 AS commissionqty,
         ca.commissionamt,
         cd.c_commissiondetail_id,
         cd.reference,
         cd.c_orderline_id,
         cd.c_invoiceline_id,
         cd.info,
         cd.c_currency_id,
         cd.actualamt,
         cd.convertedamt,
         cd.actualqty,
         i.documentno                                                 AS invoicedocumentno,
         COALESCE(i.dateinvoiced, o.dateordered)                      AS datedoc,
         COALESCE(il.m_product_id, ol.m_product_id)                   AS m_product_id,
         COALESCE(i.c_bpartner_id, o.c_bpartner_id)                   AS c_bpartner_id,
         COALESCE(i.c_bpartner_location_id, o.c_bpartner_location_id) AS c_bpartner_location_id,
         COALESCE(i.ad_user_id, o.ad_user_id)                         AS ad_user_id,
         COALESCE(i.c_doctype_id, o.c_doctype_id)                     AS c_doctype_id,
         cr.processing                                                AS c_commisionrun_processing,
         c.ad_org_id                                                  AS c_commission_ad_org_id,
         c.c_currency_id                                              AS c_commission_c_currency_id,
         c.created                                                    AS c_commission_created,
         c.createdby                                                  AS c_commission_createdby,
         c.createfrom,
         c.datelastrun,
         c.description                                                AS c_commission_description,
         c.docbasistype,
         c.frequencytype,
         c.isactive                                                   AS c_commission_isactive,
         c.listdetails,
         c.name                                                       AS c_commission_name,
         c.updated                                                    AS c_commission_updated,
         c.updatedby                                                  AS c_commission_updatedby,
         ca.ad_org_id                                                 AS c_commissionamt_ad_org_id,
         ca.c_commissionline_id,
         ca.created                                                   AS c_commmissionamt_created,
         ca.createdby                                                 AS c_commmissionamt_createdby,
         ca.isactive                                                  AS c_commmissionamt_isactive,
         ca.updated                                                   AS c_commmissionamt_updated,
         ca.updatedby                                                 AS c_commssionamt_updatedby,
         cd.ad_org_id                                                 AS c_commissiondetail_ad_org_id,
         cd.created                                                   AS c_commissiondetail_created,
         cd.createdby                                                 AS c_commissiondetail_createdby,
         cd.isactive                                                  AS c_commossiondetail_isactive,
         cd.updated                                                   AS c_commissiondetail_updated,
         cd.updatedby                                                 AS c_commissiondetail_updatedby,
         ol.ad_org_id                                                 AS c_orderline_ad_org_id,
         ol.ad_orgtrx_id                                              AS c_orderline_ad_orgtrx_id,
         ol.c_activity_id                                             AS c_orderline_c_activity_id,
         ol.c_bpartner_id                                             AS c_orderline_c_bpartner_id,
         ol.c_bpartner_location_id                                    AS c_orderline_c_bp_location_id,
         ol.c_campaign_id                                             AS c_orderline_c_campaign_id,
         ol.c_charge_id                                               AS c_orderline_c_charge_id,
         ol.c_currency_id                                             AS c_orderline_c_currency_id,
         ol.c_order_id                                                AS c_orderline_c_order_id,
         ol.c_project_id                                              AS c_orderline_c_project_id,
         ol.c_projectphase_id                                         AS c_orderline_c_projectphase_id,
         ol.c_projecttask_id                                          AS c_orderline_c_projecttask_id,
         ol.created                                                   AS c_orderline_created,
         ol.createdby                                                 AS c_orderline_createdby,
         ol.c_tax_id                                                  AS c_orderline_c_tax_id,
         ol.c_uom_id                                                  AS c_orderline_c_uom_id,
         ol.datedelivered,
         ol.dateinvoiced,
         ol.dateordered,
         ol.datepromised,
         ol.description                                               AS c_orderline_description,
         ol.discount,
         ol.freightamt,
         ol.isactive                                                  AS c_orderline_isactive,
         ol.isdescription,
         ol.line                                                      AS c_orderline_line,
         ol.linenetamt                                                AS c_orderline_linenetamt,
         ol.link_orderline_id,
         ol.m_attributesetinstance_id                                 AS c_orderline_m_asi_id,
         ol.m_promotion_id,
         ol.m_shipper_id                                              AS c_orderline_m_shipper_id,
         ol.m_warehouse_id                                            AS c_orderline_m_warehouse_id,
         ol.priceactual                                               AS c_orderline_priceactual,
         ol.pricecost,
         ol.priceentered                                              AS c_orderline_priceentered,
         ol.pricelist                                                 AS c_orderline_pricelist,
         ol.processed                                                 AS c_orderline_processed,
         ol.qtydelivered,
         ol.qtyentered,
         ol.qtyinvoiced                                               AS c_orderline_qtyinvoiced,
         ol.qtylostsales,
         ol.qtyordered,
         ol.qtyreserved,
         ol.ref_orderline_id                                          AS c_orderline_ref_orderline_id,
         ol.rramt                                                     AS c_orderline_rramt,
         ol.rrstartdate                                               AS c_orderline_rrstartsate,
         ol.s_resourceassignment_id                                   AS c_orderline_s_rassignment_id,
         ol.updated                                                   AS c_orderline_updated,
         ol.updatedby                                                 AS c_orderline_updatedby,
         ol.user1_id                                                  AS c_orderline_user1_id,
         ol.user2_id                                                  AS c_orderline_user2_id,
         il.ad_org_id                                                 AS c_inviceline_ad_org_id,
         il.ad_orgtrx_id                                              AS c_invoiceline_ad_orgtrx_id,
         il.a_processed,
         il.c_activity_id                                             AS c_invoiceline_c_activity_id,
         il.c_campaign_id                                             AS c_invoiceline_c_campaign_id,
         il.c_charge_id                                               AS c_invoiceline_c_charge_id,
         il.c_invoice_id,
         il.c_orderline_id                                            AS c_invoiceline_c_orderline_id,
         il.c_project_id                                              AS c_invoiceline_c_project_id,
         il.c_projectphase_id                                         AS c_invoiceline_c_projphase_id,
         il.c_projecttask_id                                          AS c_invoiceline_c_projecttask_id,
         il.created                                                   AS c_invoiceline_created,
         il.createdby                                                 AS c_invoiceline_createdby,
         il.c_tax_id                                                  AS c_invoiceline_c_tax_id,
         il.c_uom_id                                                  AS c_invoiceline_c_uom_id,
         il.description                                               AS c_invoiceline_description,
         il.isactive                                                  AS c_invoiceline_isactive,
         il.isdescription                                             AS c_invoiceline_isdescription,
         il.isprinted,
         il.line                                                      AS c_invoiceline_line,
         il.linenetamt                                                AS c_invoiceline_linenetamt,
         il.linetotalamt                                              AS c_invoiceline_linetotalamt,
         il.m_attributesetinstance_id                                 AS c_invoiceline_m_asi_id,
         il.m_inoutline_id,
         il.m_rmaline_id                                              AS c_invoiceline_m_rmaline_id,
         il.priceactual                                               AS c_invoiceline_priceactual,
         il.priceentered                                              AS c_invoiceline_priceentered,
         il.pricelimit                                                AS c_invoiceline_pricelimit,
         il.pricelist                                                 AS c_invoiceline_pricelist,
         il.processed                                                 AS c_invoiceline_processed,
         il.qtyentered                                                AS c_invoiceline_qtyentered,
         il.qtyinvoiced                                               AS c_invoiceline_qtyinvoiced,
         il.ref_invoiceline_id                                        AS c_invoiceline_ref_invline_id,
         il.rramt                                                     AS c_invoiceline_rramt,
         il.rrstartdate                                               AS c_invoiceline_rrstartdate,
         il.s_resourceassignment_id                                   AS c_invoiceline_s_rassignment_id,
         il.taxamt                                                    AS c_invoiceline_taxamt,
         il.updated                                                   AS c_invoiceline_updated,
         il.updatedby                                                 AS c_invoiceline_updatedby,
         il.user1_id                                                  AS c_invoiceline_user1_id,
         il.user2_id                                                  AS c_invoiceline_user2_id,
         o.ad_org_id                                                  AS c_order_ad_org_id,
         o.ad_orgtrx_id                                               AS c_order_ad_orgtrx_id,
         o.ad_user_id                                                 AS c_order_ad_user_id,
         o.amountrefunded,
         o.amounttendered,
         o.bill_bpartner_id,
         o.bill_location_id,
         o.bill_user_id,
         o.c_activity_id,
         o.c_campaign_id                                              AS c_order_c_campaign_id,
         o.c_cashline_id,
         o.c_cashplanline_id,
         o.c_charge_id,
         o.c_conversiontype_id,
         o.c_currency_id                                              AS c_order_c_currency_id,
         o.c_doctypetarget_id,
         o.chargeamt                                                  AS c_order_chargeamt,
         o.copyfrom                                                   AS c_order_copyfrom,
         o.c_order_id                                                 AS c_order_c_order_id,
         o.c_payment_id                                               AS c_order_c_payment_id,
         o.c_paymentterm_id                                           AS c_order_paymentterm_id,
         o.c_pos_id,
         o.c_project_id                                               AS c_order_c_project_id,
         o.created                                                    AS c_order_created,
         o.createdby                                                  AS c_order_createdby,
         o.dateacct                                                   AS c_order_dateacct,
         o.dateprinted                                                AS c_order_dateprinted,
         o.datepromised                                               AS c_order_datepromised,
         o.deliveryrule                                               AS c_order_deliveryrule,
         o.deliveryviarule                                            AS c_order_deliveryviarule,
         o.description                                                AS c_order_description,
         o.docaction                                                  AS c_order_docaction,
         o.docstatus                                                  AS c_order_docstatus,
         o.documentno                                                 AS c_order_documentno,
         o.dropship_bpartner_id,
         o.dropship_location_id,
         o.dropship_user_id,
         o.freightamt                                                 AS c_order_freightamt,
         o.freightcostrule                                            AS c_order_freightcostrule,
         o.grandtotal                                                 AS c_order_grandtotal,
         o.invoicerule,
         o.isactive                                                   AS c_order_isactive,
         o.isapproved,
         o.iscreditapproved,
         o.isdelivered,
         o.isdiscountprinted,
         o.isdropship,
         o.isinvoiced,
         o.ispayschedulevalid,
         o.isprinted                                                  AS c_order_isprinted,
         o.isselected                                                 AS c_order_isselected,
         o.isselfservice                                              AS c_order_isselfservice,
         o.issotrx                                                    AS c_order_issotrx,
         o.istaxincluded                                              AS c_order_istaxincluded,
         o.istransferred,
         o.link_order_id,
         o.m_freightcategory_id,
         o.m_pricelist_id,
         o.m_shipper_id                                               AS c_order_m_shipper_id,
         o.m_warehouse_id                                             AS c_order_m_warehouse_id,
         o.ordertype,
         o.pay_bpartner_id,
         o.pay_location_id,
         o.paymentrule,
         o.poreference,
         o.posted                                                     AS c_order_posted,
         o.priorityrule,
         o.processed                                                  AS c_order_processed,
         o.processedon                                                AS c_order_processedon,
         o.promotioncode,
         o.ref_order_id                                               AS c_order_ref_order_id,
         o.sendemail                                                  AS c_order_sendemail,
         o.totallines                                                 AS c_order_totallines,
         o.user1_id                                                   AS c_order_user1_id,
         o.user2_id                                                   AS c_order_user2_id,
         i.ad_org_id                                                  AS c_invoice_ad_org_id,
         i.ad_orgtrx_id                                               AS c_invoice_ad_orgtrx_id,
         i.c_activity_id                                              AS c_invoice_c_activity_id,
         i.c_campaign_id                                              AS c_invoice_c_campaign_id,
         i.c_charge_id                                                AS c_invoice_c_charge_id,
         i.c_conversiontype_id                                        AS c_invoice_c_conversiontype_id,
         i.c_currency_id                                              AS c_invoice_c_currency_id,
         i.c_doctypetarget_id                                         AS c_invoice_c_doctypetarget_id,
         i.c_dunninglevel_id,
         i.chargeamt                                                  AS c_invoice_chargeamt,
         i.c_invoice_id                                               AS c_invoice_c_invoice_id,
         i.c_order_id                                                 AS c_invoice_c_order_id,
         i.c_payment_id                                               AS c_invoice_c_payment_id,
         i.c_paymentterm_id                                           AS c_invoice_c_paymentterm_id,
         i.c_project_id                                               AS c_invoice_c_project_id,
         i.created                                                    AS c_invoice_created,
         i.createdby                                                  AS c_invoice_createdby,
         i.dateacct                                                   AS c_invoice_dateacct,
         i.dateordered                                                AS c_invoice_dateordered,
         i.dateprinted                                                AS c_invoice_dateprinted,
         i.description                                                AS c_invoice_description,
         i.docaction                                                  AS c_invoice_docaction,
         i.docstatus                                                  AS c_invoice_docstatus,
         i.dunninggrace                                               AS c_invoice_dunninggrace,
         i.generateto,
         i.grandtotal                                                 AS c_invoice_grandtotal,
         i.invoicecollectiontype,
         i.isactive                                                   AS c_invoice_isactive,
         i.isapproved                                                 AS c_invoice_isapproved,
         i.isdiscountprinted                                          AS c_invoice_isdiscountprinted,
         i.isindispute                                                AS c_invoice_isindispute,
         i.ispayschedulevalid                                         AS c_invoice_ispayschedulevalid,
         i.isprinted                                                  AS c_invoice_isprinted,
         i.isselfservice                                              AS c_invoice_isselfservice,
         i.issotrx                                                    AS c_invoice_issotrx,
         i.istaxincluded                                              AS c_invoice_istaxincluded,
         i.istransferred                                              AS c_invoice_istransferred,
         i.m_pricelist_id                                             AS c_invoice_m_pricelist_id,
         i.m_rma_id                                                   AS c_invoice_m_rma_id,
         i.paymentrule                                                AS c_invoice_paymentrule,
         i.poreference                                                AS c_invoice_poreference,
         i.posted                                                     AS c_invoice_posted,
         i.processedon                                                AS c_invoice_processedon,
         i.processing                                                 AS c_invoice_processing,
         i.ref_invoice_id,
         i.reversal_id,
         i.salesrep_id                                                AS c_invoice_salesrep_id,
         i.sendemail                                                  AS c_invoice_sendemail,
         i.totallines                                                 AS c_invoice_totallines,
         i.updated                                                    AS c_invoice_updated,
         i.updatedby                                                  AS c_invoice_updatedby,
         i.user1_id                                                   AS c_invoice_user1_id,
         i.user2_id                                                   AS c_invoice_user2_id
  FROM   c_commissionrun cr
         JOIN c_commission c
           ON cr.c_commission_id = c.c_commission_id
         JOIN c_commissionamt ca
           ON cr.c_commissionrun_id = ca.c_commissionrun_id
         JOIN c_commissiondetail cd
           ON ca.c_commissionamt_id = cd.c_commissionamt_id
         LEFT JOIN c_orderline ol
                ON cd.c_orderline_id = ol.c_orderline_id
         LEFT JOIN c_invoiceline il
                ON cd.c_invoiceline_id = il.c_invoiceline_id
         LEFT JOIN c_order o
                ON ol.c_order_id = o.c_order_id
         LEFT JOIN c_invoice i
                ON il.c_invoice_id = i.c_invoice_id
;

