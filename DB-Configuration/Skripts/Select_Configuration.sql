SELECT 
  vip2012_classes.path, 
  vip2012_classes.name, 
  vip2012_sections.name, 
  vip2012_items.name, 
  vip2012_itemvalues.data
FROM 
  public.vip2012_sections, 
  public.vip2012_items, 
  public.vip2012_itemvalues, 
  public.vip2012_classes
WHERE 
  vip2012_sections.fk_classes = vip2012_classes.id AND
  vip2012_itemvalues.fk_sections = vip2012_sections.id AND
  vip2012_itemvalues.fk_items = vip2012_items.id
ORDER BY
  vip2012_sections.name ASC, 
  vip2012_items.name ASC;
