{**
 * templates/frontend/components/siteBanner.tpl
 *
 * @brief Site banner component
 *
 * @uses sitebanner_should_display boolean Whether the site banner should be displayed
 * @uses sitebanner_content string The content of the site banner
 *}
{if $sitebanner_should_display}
	<div class="site-banner">
		<div class="container">
			<i class="kbico-exclamation"></i>
			{$sitebanner_content}
		</div>
	</div>
{/if}