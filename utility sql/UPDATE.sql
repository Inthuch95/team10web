UPDATE [MODULES] 
SET [module_code] = RIGHT([module_code], LEN([module_code]) - 2);
