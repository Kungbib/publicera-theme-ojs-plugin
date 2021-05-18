<div class="headerSearch col col-md-10 col-lg-8 col-xl-6">
  <i class="kbico-search"></i>
	{capture name="searchFormUrl"}{url escape=false}{/capture}
	{assign var=formUrlParameters value=[]}{* Prevent Smarty warning *}
	{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
	<form class="cmp_form" method="get" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
		{foreach from=$formUrlParameters key=paramKey item=paramValue}
			<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
		{/foreach}

		{* Repeat the label text just so that screen readers have a clear
		   label/input relationship *}
		<div class="search_input">
			{block name=searchQuery}
				<input type="text" id="query" name="query" value="{$query|escape}" aria-label="{translate key='search.searchFor'}" class="query" placeholder="{translate|escape key="common.search"}">
			{/block}
		</div>
	</form>
</div>