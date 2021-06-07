{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div class="page page_login d-flex justify-content-center">

	<form class="cmp_form cmp_form login bg-light justify-content-center p-4 align-self-center col col-md-12 col-lg-8 col-xl-6" id="login" method="post" action="{$loginUrl}">
		<!-- <h1 class="m-0">
			{translate key="user.login"}
		</h1> -->
		{csrf}

		{if $error}
			<div class="pkp_form_error">
				{translate key=$error reason=$reason}
			</div>
		{/if}

		{* A login message may be displayed if the user was redireceted to the
			login page from another request. Examples include if login is required
			before dowloading a file. *}
		{if $loginMessage}
			<p>
				{translate key=$loginMessage}
			</p>
		{/if}

		<input type="hidden" name="source" value="{$source|escape}" />

			<div class="username mb-3">
				<label class="form-label label" for="username">
						{translate key="user.username"}
				</label>
				<input type="text" class="form-control" name="username" id="username" value="{$username|escape}" maxlength="32" required aria-required="true">
			</div>
			<div class="password mb-3">
				<label class="form-label label" for="password">
						{translate key="user.password"}
				</label>
				<input class="form-control" type="password" name="password" id="password" value="{$password|escape}" password="true" maxlength="32" required aria-required="true">
				<div class="form-text">
					<a href="{url page="login" op="lostPassword"}">
						{translate key="user.login.forgotPassword"}
					</a>
				</div>
			</div>
			<div class="remember checkbox mb-3 form-check">
				<input type="checkbox" class="form-check-input" name="remember" id="remember" value="1" checked="$remember">
				<label class="form-check-label" for="remember">
					{translate key="user.login.rememberUsernameAndPassword"}
				</label>
			</div>
			<div class="buttons d-grid gap-2">
					<button class="submit btn btn-primary btn-round" type="submit">
						{translate key="user.login"}
					</button>
			</div>
	</form>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
