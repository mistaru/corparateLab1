<#import "parts/common.ftl" as c>
<@c.page>

    <div style="text-align: center;"><h1>Добавить ингридиент</h1></div>

    <div>
        <form method="post"  action="/new_component/add">

            <div class="form-outline mb-4">
                <input type="text"  name="nameDish" value="${Dish.nameDish}" class="form-control" />
                <label class="form-label" for="form4Example1">Блюдо</label>
            </div>

            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example2">Ингридиент</label>
                <select name="productName" class="custom-select mb-2">
                    <option selected="selected">Выберите ингредиент</option>
                    <#if ingredientsList??>
                        <#list ingredientsList as ingredientsList>
                            <option>${ingredientsList.getProductName()}</option>
                        </#list>
                    </#if>
                </select>
            </div>

            <div class="form-outline mb-4">
                <input type="number" class="form-control mb-2 mr-sm-2" name="count"
                       placeholder="Кол-во(шт,пч,100гр)"/>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Добавить</button>
        </form>
    </div>

</@c.page>


