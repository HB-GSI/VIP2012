SELECT 
  vip2012_itemvalues.data
FROM 
  public.vip2012_sections, 
  public.vip2012_items, 
  public.vip2012_itemvalues
WHERE 
  vip2012_itemvalues.fk_sections = vip2012_sections.id AND
  vip2012_itemvalues.fk_items = vip2012_items.id AND
  vip2012_sections.name = 'Sec_2a' AND 
  vip2012_items.name = 'I32';
