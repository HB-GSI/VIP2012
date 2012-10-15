select id from VIP2012_itemvalues
where
	VIP2012_itemvalues.fk_sections = (select vip2012_sections.id from vip2012_sections where name='Sec_2a') AND
	VIP2012_itemvalues.fk_items = (select vip2012_items.id from vip2012_items where name='I32')
	;