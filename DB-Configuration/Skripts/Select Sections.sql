SELECT 
  vip2012_sections.name, 
  vip2012_classes.path, 
  vip2012_classes.name
FROM 
  public.vip2012_sections, 
  public.vip2012_classes
WHERE 
  vip2012_sections.fk_classes = vip2012_classes.id
ORDER BY
  vip2012_sections.name ASC;
