<#import "parts/common.ftl" as c>
<@c.page>

    <div style="text-align: center;"><h1>Новый ингридиент</h1></div>

    <div>
        <form method="post"  action="/new_ingredient/add">
            <div class="form-outline mb-4">
                <input type="text"  name="productName" class="form-control" />
                <label class="form-label" for="form4Example1">Название</label>
            </div>

            <div class="form-outline mb-4">
                <select name="enumUnit" class="custom-select mb-2">
                    <option>Грамм</option>
                    <option>Пучок</option>
                    <option>Штук</option>
                </select>
                <label class="form-label" for="form4Example2">Единица измерения</label>
            </div>

            <div class="form-outline mb-4">
                <input type="number"  name="price" class="form-control" />
                <label class="form-label" for="form4Example3">Цена(шт,пч,100гр)</label>
            </div>

            <button type="submit" class="btn btn-primary btn-block mb-4">Добавить</button>
        </form>
    </div>

</@c.page>


