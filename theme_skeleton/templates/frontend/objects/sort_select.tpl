
{if !$id}
	{assign var="id" value="sort"}
{/if}

<div class="input-select">
	<select id="{$id}" aria-label="{translate key="plugins.themes.publicera_theme.sorting.label"}">
		<option value="titleAsc">
			{translate key="plugins.themes.publicera_theme.sorting.alphabetic_asc"}
		</option>

		<option value="titleDesc">
			{translate key="plugins.themes.publicera_theme.sorting.alphabetic_desc"}
		</option>

		<option value="id">
			{translate key="plugins.themes.publicera_theme.sorting.newest"}
		</option>

		<option value="dateDesc">
			{translate key="plugins.themes.publicera_theme.sorting.date"}
		</option>
	</select>
</div>