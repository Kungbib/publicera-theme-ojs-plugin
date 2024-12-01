
{if !$id}
	{assign var="id" value="sort"}
{/if}

<div class="input-select">
	<select id="{$id}">
		<option value="titleAsc">
			A-Ö
		</option>

		<option value="titleDesc">
			Ö-A
		</option>

		<option value="id">
			Nyaste tidsskrift
		</option>
	</select>
</div>