{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}

<div class="page page_lost_password d-flex justify-content-center">

	<form class="cmp_form lost_password  bg-light justify-content-center p-4 align-self-center col col-md-12 col-lg-8 col-xl-6" id="lostPasswordForm" action="{url page="login" op="requestResetPassword"}" method="post">
		<h1>
			{translate key="user.login.resetPassword"}
		</h1>
		<p>{translate key="user.login.resetPasswordInstructions"}</p>
		{csrf}
		{if $error}
			<div class="pkp_form_error">
				{translate key=$error}
			</div>
		{/if}

		<div class="fields">
			<div class="email mb-3">
				<label class="form-label label" for="email">
					{translate key="user.login.registeredEmail"}
				</label>
				<input type="email" class="form-control" name="email" id="email" value="{$email|escape}" required aria-required="true">
			</div>
			<div class="buttons d-grid gap-2">
				<button class="submit btn btn-primary btn-round" type="submit">
					{translate key="user.login.resetPassword"}
				</button>

				{if !$disableUserReg}
					{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
					<a href="{$registerUrl}" class="register btn btn-link">
						{translate key="user.login.registerNewAccount"}
					</a>
				{/if}
			</div>
		</div>

	</form>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
