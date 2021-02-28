<#import "parts/common.ftl" as c>
<@c.page>
    <div style="text-align: center;"><h1>Подробно</h1></div>
    <div>
        <a href="/new_component/${dish.id}"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-bag-plus-fill" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zM8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5V8z"/>
            </svg></a>
        <form>
            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example1">Название</label>
                <input type="text" name="description" value="${dish.nameDish}" class="form-control" />
            </div>

            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example2">Описание</label>
                <input type="text" name="description" value="${dish.description}" class="form-control" />
            </div>

            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example3">Цена</label>
                <input type="number"  name="price" value="${dish.price}" class="form-control" />
            </div>

            <table class="table">
                <thead>
                <tr>
                    <th>Ингридиенты</th>
                    <th>Единицы измерения</th>
                    <th>Цена</th>

                </tr>
                </thead>
                <tbody>
                <#if list??>
                    <#list list as list>
                        <tr>
                            <td>${list.ingredients.productName}</td>
                            <td>${list.ingredients.getEnumUnit()}</td>
                            <td>${list.ingredients.getPrice()}</td>
                        </tr>
                    <#else>
                        Список пуст. Добавьте ингридиенты.
                    </#list>
                </#if>
                </tbody>
            </table>

        </form>
    </div>

</@c.page>


