<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?= $page_title.' | '.$Settings->site_name; ?></title>
    <link rel="shortcut icon" href="<?= $assets ?>images/icon.png"/>
    <?php if ($this->db->dbdriver != 'sqlite3') { ?>
    <script type="text/javascript">if (parent.frames.length !== 0) { top.location = '<?=site_url('login')?>'; }</script>
    <?php } ?>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes" name="viewport">
    <link href="<?= $assets ?>dist/css/styles.css" rel="stylesheet" type="text/css" />
    <?= $Settings->rtl ? '<link href="'.$assets.'dist/css/rtl.css" rel="stylesheet" />' : ''; ?>
</head>
<body class="login-page login-page-<?= $Settings->theme_style; ?> rtl rtl-inv">
    <div class="login-box">
        <div class="login-logo">
            <a href="<?=base_url();?>"><?= $Settings->site_name == 'SimplePOS' ? 'Kusini Tavern<b>POS</b>' : '<img src="'.base_url('uploads/'.$Settings->logo).'" alt="'.$Settings->site_name.'" style="width: 100%;" />'; ?></a>
        </div>
        <div class="login-box-body">
            <?php if ($error)  { ?>
            <div class="alert alert-danger alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                <?= $error; ?>
            </div>
            <?php } if ($message) { ?>
            <div class="alert alert-success alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                <?= $message; ?>
            </div>
            <?php } ?>
            <p class="login-box-msg"><?= lang('login_to_your_account'); ?></p>
            <?= form_open("auth/login", 'class ="fv-form fv-form-bootstrap"'); ?>
            <div class="form-group">
                <?php
                $cu = [];
                $cu[''] = lang("select")." ".lang("user");
                foreach ($users as $user) {
                    $cu[$user->username] = $user->username;
                }?>
                <?= form_dropdown('identity', $cu, set_value('user'), 'class="form-control select2 tip" id="identity"  required="required" style="width:100%;"'); ?>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            
            <div class="form-group has-feedback">
                <input id= "password" type="password" name="password" value="" class="form-control kb-text ui-keyboard-input ui-widget-content ui-corner-all ui-keyboard-autoaccepted" placeholder="<?= lang('password'); ?>" aria-haspopup="true" />
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div class="checkbox pull-left" style="margin-top: 0;">
                <div class="custom-checkbox">
                    <?php echo form_checkbox('remember', '1', TRUE, 'id="remember"'); ?>
                    <label for="remember" style="padding-left:5px;"><?= lang('remember_me') ?></label>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="glyphicon glyphicon-log-in"></i> &nbsp;<?= lang('sign_in'); ?></button>

            <?= form_close(); ?>

            <div class="">
                <p>&nbsp;</p>
                <p><span class="text-danger"><?= lang('forgot_your_password'); ?></span><br>
                    <?= lang('dont_worry'); ?> <a href="#" class="text-danger" data-toggle="modal" data-target="#myModal"><?= lang('click_here'); ?></a> <?= lang('to_reset'); ?> </p>

                </div>

            </div>
        </div>

        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal"
        class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <?php echo form_open("auth/forgot_password"); ?>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</i></button>
                    <h4 class="modal-title"><?= lang('forgot_password'); ?></h4>
                </div>
                <div class="modal-body">
                    <p><?= lang('forgot_password_heading'); ?></p>
                    <input type="email" name="forgot_email" placeholder="<?= lang('email'); ?>" autocomplete="off"
                    class="form-control placeholder-no-fix">
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default pull-left" type="button"><?= lang('close'); ?></button>
                    <button class="btn btn-primary" type="submit"><?= lang('submit'); ?></button>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    var base_url = '<?=base_url();?>', assets = '<?= $assets ?>';
    var dateformat = '<?=$Settings->dateformat;?>', timeformat = '<?= $Settings->timeformat ?>';
    <?php unset($Settings->protocol, $Settings->smtp_host, $Settings->smtp_user, $Settings->smtp_pass, $Settings->smtp_port, $Settings->smtp_crypto, $Settings->mailpath, $Settings->timezone, $Settings->setting_id, $Settings->default_email, $Settings->version, $Settings->stripe, $Settings->stripe_secret_key, $Settings->stripe_publishable_key); ?>
    var Settings = <?= json_encode($Settings); ?>;
    </script>

    <script src="<?= $assets ?>plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="<?= $assets ?>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<?= $assets ?>plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script src="<?= $assets ?>dist/js/libraries.min.js" type="text/javascript"></script>
    <script src="<?= $assets ?>dist/js/scripts.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $('#identity').on('change', function(){
                $('#password').val('');
                $('#password').focus()
            });
            
            if (Settings.display_kb == 1) {
                    display_keyboards();
                }
            if ($('#identity').val())
                $('#password').focus();
            else
                $('#identity').focus();
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%'
            });
        });
        function display_keyboards() {
        $('.kb-text').keyboard({
            autoAccept: true,
            alwaysOpen: false,
            openOn: 'focus',
            usePreview: false,
            // layout: 'qwerty',
            layout: 'custom',
            display: {
                bksp: '\u2190',
                accept: 'return',
                default: 'ABC',
                meta1: '123',
                meta2: '#+=',
            },
            customLayout: {
                default: [
                    'q w e r t y u i o p {bksp}',
                    'a s d f g h j k l {enter}',
                    '{s} z x c v b n m , . {s}',
                    '{meta1} {space} {cancel} {accept}',
                ],
                shift: [
                    'Q W E R T Y U I O P {bksp}',
                    'A S D F G H J K L {enter}',
                    '{s} Z X C V B N M / ? {s}',
                    '{meta1} {space} {meta1} {accept}',
                ],
                meta1: [
                    '1 2 3 4 5 6 7 8 9 0 {bksp}',
                    '- / : ; ( ) \u20ac & @ {enter}',
                    '{meta2} . , ? ! \' " {meta2}',
                    '{default} {space} {default} {accept}',
                ],
                meta2: [
                    '[ ] { } # % ^ * + = {bksp}',
                    '_ \\ | &lt; &gt; $ \u00a3 \u00a5 {enter}',
                    '{meta1} ~ . , ? ! \' " {meta1}',
                    '{default} {space} {default} {accept}',
                ],
            },
        });

        $('.kb-pad').keyboard({
            restrictInput: true,
            preventPaste: true,
            autoAccept: true,
            alwaysOpen: false,
            openOn: 'click',
            usePreview: false,
            layout: 'costom',
            display: {
                b: '\u2190:Backspace',
            },
            customLayout: {
                default: ['1 2 3 {b}', '4 5 6 . {clear}', '7 8 9 0 %', '{accept} {cancel}'],
            },
        });
}
    </script>
</body>
</html>
