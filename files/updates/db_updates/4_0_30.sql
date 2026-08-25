ALTER TABLE `tec_sales`
    MODIFY `sale_mode` ENUM('whole_sale','retail_sale','cost_sale') NOT NULL DEFAULT 'retail_sale',
    ADD `cost_sale_reason` VARCHAR(255) NULL AFTER `sale_mode`,
    ADD `cost_sale_authorized_by` INT NULL AFTER `cost_sale_reason`,
    ADD `cost_sale_authorized_at` DATETIME NULL AFTER `cost_sale_authorized_by`;

ALTER TABLE `tec_suspended_sales`
    MODIFY `sale_mode` ENUM('whole_sale','retail_sale','cost_sale') NOT NULL DEFAULT 'retail_sale',
    ADD `cost_sale_reason` VARCHAR(255) NULL AFTER `sale_mode`,
    ADD `cost_sale_authorized_by` INT NULL AFTER `cost_sale_reason`,
    ADD `cost_sale_authorized_at` DATETIME NULL AFTER `cost_sale_authorized_by`;

UPDATE `tec_settings` SET `version` = '4.0.30' WHERE `setting_id` = 1;
